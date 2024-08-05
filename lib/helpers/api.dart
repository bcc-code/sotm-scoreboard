import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:js/js.dart';
import '../graphql/statistics.graphql.dart';
import 'dart:js_util';

import '../model.dart';

@JS('decrypt')
external Object decrypt(String password);

GraphQLClient getClient(String apiKey) {
  final httpLink = HttpLink(
    'https://api.brunstad.tv/admin',
  );

  final authLink = AuthLink(
    headerKey: "x-api-key",
    getToken: () async => apiKey,
  );

  Link link = authLink.concat(httpLink);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );
}

class Api {
  final String apiKey;
  Api({required this.apiKey});

  static Future<Api> getFromPassword(String password) async {
    final apiKey = await promiseToFuture<String>(decrypt(password));
    return Api(apiKey: apiKey);
  }

  Future<List<Scoreboard>> getScoreboards(String lessonId) async {
    final client = getClient(apiKey);
    final smallChurch = await client.query$lessonProgressGroupedByOrg(
      Options$Query$lessonProgressGroupedByOrg(
        variables: Variables$Query$lessonProgressGroupedByOrg(
          lessonId: lessonId,
          orgMinSize: 0,
          orgMaxSize: 59,
        ),
      ),
    );
    final bigChurch = await client.query$lessonProgressGroupedByOrg(
      Options$Query$lessonProgressGroupedByOrg(
        variables: Variables$Query$lessonProgressGroupedByOrg(
          lessonId: lessonId,
          orgMinSize: 60,
          orgMaxSize: 9999,
        ),
      ),
    );
    return [
      Scoreboard(
        title: 'Store menigheter',
        items: bigChurch.parsedData!.statistics.lessonProgressGroupedByOrg
            .map((e) => mapScoreboardItem(e))
            .toList(),
      ),
      Scoreboard(
        title: 'Små menigheter',
        items: smallChurch.parsedData!.statistics.lessonProgressGroupedByOrg
            .map((e) => mapScoreboardItem(e))
            .toList(),
      ),
    ];
  }
}

ScoreboardItem mapScoreboardItem(Fragment$ProgressByOrg frag) {
  return ScoreboardItem(name: frag.name, progress: frag.progress);
}
