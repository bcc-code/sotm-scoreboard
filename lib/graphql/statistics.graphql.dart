import 'package:flutter/widgets.dart' as widgets;
import 'package:gql/ast.dart';
import 'package:graphql/client.dart' as graphql;
import 'package:graphql_flutter/graphql_flutter.dart' as graphql_flutter;

class Fragment$ProgressByOrg {
  Fragment$ProgressByOrg({
    required this.name,
    required this.progress,
    required this.$__typename,
  });

  factory Fragment$ProgressByOrg.fromJson(Map<String, dynamic> json) {
    final l$name = json['name'];
    final l$progress = json['progress'];
    final l$$__typename = json['__typename'];
    return Fragment$ProgressByOrg(
      name: (l$name as String),
      progress: (l$progress as num).toDouble(),
      $__typename: (l$$__typename as String),
    );
  }

  final String name;

  final double progress;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$name = name;
    _resultData['name'] = l$name;
    final l$progress = progress;
    _resultData['progress'] = l$progress;
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$name = name;
    final l$progress = progress;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$name,
      l$progress,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Fragment$ProgressByOrg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$name = name;
    final lOther$name = other.name;
    if (l$name != lOther$name) {
      return false;
    }
    final l$progress = progress;
    final lOther$progress = other.progress;
    if (l$progress != lOther$progress) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Fragment$ProgressByOrg on Fragment$ProgressByOrg {
  CopyWith$Fragment$ProgressByOrg<Fragment$ProgressByOrg> get copyWith =>
      CopyWith$Fragment$ProgressByOrg(
        this,
        (i) => i,
      );
}

abstract class CopyWith$Fragment$ProgressByOrg<TRes> {
  factory CopyWith$Fragment$ProgressByOrg(
    Fragment$ProgressByOrg instance,
    TRes Function(Fragment$ProgressByOrg) then,
  ) = _CopyWithImpl$Fragment$ProgressByOrg;

  factory CopyWith$Fragment$ProgressByOrg.stub(TRes res) =
      _CopyWithStubImpl$Fragment$ProgressByOrg;

  TRes call({
    String? name,
    double? progress,
    String? $__typename,
  });
}

class _CopyWithImpl$Fragment$ProgressByOrg<TRes>
    implements CopyWith$Fragment$ProgressByOrg<TRes> {
  _CopyWithImpl$Fragment$ProgressByOrg(
    this._instance,
    this._then,
  );

  final Fragment$ProgressByOrg _instance;

  final TRes Function(Fragment$ProgressByOrg) _then;

  static const _undefined = {};

  TRes call({
    Object? name = _undefined,
    Object? progress = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Fragment$ProgressByOrg(
        name: name == _undefined || name == null
            ? _instance.name
            : (name as String),
        progress: progress == _undefined || progress == null
            ? _instance.progress
            : (progress as double),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
}

class _CopyWithStubImpl$Fragment$ProgressByOrg<TRes>
    implements CopyWith$Fragment$ProgressByOrg<TRes> {
  _CopyWithStubImpl$Fragment$ProgressByOrg(this._res);

  TRes _res;

  call({
    String? name,
    double? progress,
    String? $__typename,
  }) =>
      _res;
}

const fragmentDefinitionProgressByOrg = FragmentDefinitionNode(
  name: NameNode(value: 'ProgressByOrg'),
  typeCondition: TypeConditionNode(
      on: NamedTypeNode(
    name: NameNode(value: 'ProgressByOrg'),
    isNonNull: false,
  )),
  directives: [],
  selectionSet: SelectionSetNode(selections: [
    FieldNode(
      name: NameNode(value: 'name'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: 'progress'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
    FieldNode(
      name: NameNode(value: '__typename'),
      alias: null,
      arguments: [],
      directives: [],
      selectionSet: null,
    ),
  ]),
);
const documentNodeFragmentProgressByOrg = DocumentNode(definitions: [
  fragmentDefinitionProgressByOrg,
]);

extension ClientExtension$Fragment$ProgressByOrg on graphql.GraphQLClient {
  void writeFragment$ProgressByOrg({
    required Fragment$ProgressByOrg data,
    required Map<String, dynamic> idFields,
    bool broadcast = true,
  }) =>
      this.writeFragment(
        graphql.FragmentRequest(
          idFields: idFields,
          fragment: const graphql.Fragment(
            fragmentName: 'ProgressByOrg',
            document: documentNodeFragmentProgressByOrg,
          ),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Fragment$ProgressByOrg? readFragment$ProgressByOrg({
    required Map<String, dynamic> idFields,
    bool optimistic = true,
  }) {
    final result = this.readFragment(
      graphql.FragmentRequest(
        idFields: idFields,
        fragment: const graphql.Fragment(
          fragmentName: 'ProgressByOrg',
          document: documentNodeFragmentProgressByOrg,
        ),
      ),
      optimistic: optimistic,
    );
    return result == null ? null : Fragment$ProgressByOrg.fromJson(result);
  }
}

class Variables$Query$lessonProgressGroupedByOrg {
  factory Variables$Query$lessonProgressGroupedByOrg({
    required String lessonId,
    int? orgMinSize,
    int? orgMaxSize,
  }) =>
      Variables$Query$lessonProgressGroupedByOrg._({
        r'lessonId': lessonId,
        if (orgMinSize != null) r'orgMinSize': orgMinSize,
        if (orgMaxSize != null) r'orgMaxSize': orgMaxSize,
      });

  Variables$Query$lessonProgressGroupedByOrg._(this._$data);

  factory Variables$Query$lessonProgressGroupedByOrg.fromJson(
      Map<String, dynamic> data) {
    final result$data = <String, dynamic>{};
    final l$lessonId = data['lessonId'];
    result$data['lessonId'] = (l$lessonId as String);
    if (data.containsKey('orgMinSize')) {
      final l$orgMinSize = data['orgMinSize'];
      result$data['orgMinSize'] = (l$orgMinSize as int?);
    }
    if (data.containsKey('orgMaxSize')) {
      final l$orgMaxSize = data['orgMaxSize'];
      result$data['orgMaxSize'] = (l$orgMaxSize as int?);
    }
    return Variables$Query$lessonProgressGroupedByOrg._(result$data);
  }

  Map<String, dynamic> _$data;

  String get lessonId => (_$data['lessonId'] as String);
  int? get orgMinSize => (_$data['orgMinSize'] as int?);
  int? get orgMaxSize => (_$data['orgMaxSize'] as int?);
  Map<String, dynamic> toJson() {
    final result$data = <String, dynamic>{};
    final l$lessonId = lessonId;
    result$data['lessonId'] = l$lessonId;
    if (_$data.containsKey('orgMinSize')) {
      final l$orgMinSize = orgMinSize;
      result$data['orgMinSize'] = l$orgMinSize;
    }
    if (_$data.containsKey('orgMaxSize')) {
      final l$orgMaxSize = orgMaxSize;
      result$data['orgMaxSize'] = l$orgMaxSize;
    }
    return result$data;
  }

  CopyWith$Variables$Query$lessonProgressGroupedByOrg<
          Variables$Query$lessonProgressGroupedByOrg>
      get copyWith => CopyWith$Variables$Query$lessonProgressGroupedByOrg(
            this,
            (i) => i,
          );
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Variables$Query$lessonProgressGroupedByOrg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lessonId = lessonId;
    final lOther$lessonId = other.lessonId;
    if (l$lessonId != lOther$lessonId) {
      return false;
    }
    final l$orgMinSize = orgMinSize;
    final lOther$orgMinSize = other.orgMinSize;
    if (_$data.containsKey('orgMinSize') !=
        other._$data.containsKey('orgMinSize')) {
      return false;
    }
    if (l$orgMinSize != lOther$orgMinSize) {
      return false;
    }
    final l$orgMaxSize = orgMaxSize;
    final lOther$orgMaxSize = other.orgMaxSize;
    if (_$data.containsKey('orgMaxSize') !=
        other._$data.containsKey('orgMaxSize')) {
      return false;
    }
    if (l$orgMaxSize != lOther$orgMaxSize) {
      return false;
    }
    return true;
  }

  @override
  int get hashCode {
    final l$lessonId = lessonId;
    final l$orgMinSize = orgMinSize;
    final l$orgMaxSize = orgMaxSize;
    return Object.hashAll([
      l$lessonId,
      _$data.containsKey('orgMinSize') ? l$orgMinSize : const {},
      _$data.containsKey('orgMaxSize') ? l$orgMaxSize : const {},
    ]);
  }
}

abstract class CopyWith$Variables$Query$lessonProgressGroupedByOrg<TRes> {
  factory CopyWith$Variables$Query$lessonProgressGroupedByOrg(
    Variables$Query$lessonProgressGroupedByOrg instance,
    TRes Function(Variables$Query$lessonProgressGroupedByOrg) then,
  ) = _CopyWithImpl$Variables$Query$lessonProgressGroupedByOrg;

  factory CopyWith$Variables$Query$lessonProgressGroupedByOrg.stub(TRes res) =
      _CopyWithStubImpl$Variables$Query$lessonProgressGroupedByOrg;

  TRes call({
    String? lessonId,
    int? orgMinSize,
    int? orgMaxSize,
  });
}

class _CopyWithImpl$Variables$Query$lessonProgressGroupedByOrg<TRes>
    implements CopyWith$Variables$Query$lessonProgressGroupedByOrg<TRes> {
  _CopyWithImpl$Variables$Query$lessonProgressGroupedByOrg(
    this._instance,
    this._then,
  );

  final Variables$Query$lessonProgressGroupedByOrg _instance;

  final TRes Function(Variables$Query$lessonProgressGroupedByOrg) _then;

  static const _undefined = {};

  TRes call({
    Object? lessonId = _undefined,
    Object? orgMinSize = _undefined,
    Object? orgMaxSize = _undefined,
  }) =>
      _then(Variables$Query$lessonProgressGroupedByOrg._({
        ..._instance._$data,
        if (lessonId != _undefined && lessonId != null)
          'lessonId': (lessonId as String),
        if (orgMinSize != _undefined) 'orgMinSize': (orgMinSize as int?),
        if (orgMaxSize != _undefined) 'orgMaxSize': (orgMaxSize as int?),
      }));
}

class _CopyWithStubImpl$Variables$Query$lessonProgressGroupedByOrg<TRes>
    implements CopyWith$Variables$Query$lessonProgressGroupedByOrg<TRes> {
  _CopyWithStubImpl$Variables$Query$lessonProgressGroupedByOrg(this._res);

  TRes _res;

  call({
    String? lessonId,
    int? orgMinSize,
    int? orgMaxSize,
  }) =>
      _res;
}

class Query$lessonProgressGroupedByOrg {
  Query$lessonProgressGroupedByOrg({
    required this.statistics,
    required this.$__typename,
  });

  factory Query$lessonProgressGroupedByOrg.fromJson(Map<String, dynamic> json) {
    final l$statistics = json['statistics'];
    final l$$__typename = json['__typename'];
    return Query$lessonProgressGroupedByOrg(
      statistics: Query$lessonProgressGroupedByOrg$statistics.fromJson(
          (l$statistics as Map<String, dynamic>)),
      $__typename: (l$$__typename as String),
    );
  }

  final Query$lessonProgressGroupedByOrg$statistics statistics;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$statistics = statistics;
    _resultData['statistics'] = l$statistics.toJson();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$statistics = statistics;
    final l$$__typename = $__typename;
    return Object.hashAll([
      l$statistics,
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$lessonProgressGroupedByOrg) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$statistics = statistics;
    final lOther$statistics = other.statistics;
    if (l$statistics != lOther$statistics) {
      return false;
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$lessonProgressGroupedByOrg
    on Query$lessonProgressGroupedByOrg {
  CopyWith$Query$lessonProgressGroupedByOrg<Query$lessonProgressGroupedByOrg>
      get copyWith => CopyWith$Query$lessonProgressGroupedByOrg(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$lessonProgressGroupedByOrg<TRes> {
  factory CopyWith$Query$lessonProgressGroupedByOrg(
    Query$lessonProgressGroupedByOrg instance,
    TRes Function(Query$lessonProgressGroupedByOrg) then,
  ) = _CopyWithImpl$Query$lessonProgressGroupedByOrg;

  factory CopyWith$Query$lessonProgressGroupedByOrg.stub(TRes res) =
      _CopyWithStubImpl$Query$lessonProgressGroupedByOrg;

  TRes call({
    Query$lessonProgressGroupedByOrg$statistics? statistics,
    String? $__typename,
  });
  CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> get statistics;
}

class _CopyWithImpl$Query$lessonProgressGroupedByOrg<TRes>
    implements CopyWith$Query$lessonProgressGroupedByOrg<TRes> {
  _CopyWithImpl$Query$lessonProgressGroupedByOrg(
    this._instance,
    this._then,
  );

  final Query$lessonProgressGroupedByOrg _instance;

  final TRes Function(Query$lessonProgressGroupedByOrg) _then;

  static const _undefined = {};

  TRes call({
    Object? statistics = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$lessonProgressGroupedByOrg(
        statistics: statistics == _undefined || statistics == null
            ? _instance.statistics
            : (statistics as Query$lessonProgressGroupedByOrg$statistics),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> get statistics {
    final local$statistics = _instance.statistics;
    return CopyWith$Query$lessonProgressGroupedByOrg$statistics(
        local$statistics, (e) => call(statistics: e));
  }
}

class _CopyWithStubImpl$Query$lessonProgressGroupedByOrg<TRes>
    implements CopyWith$Query$lessonProgressGroupedByOrg<TRes> {
  _CopyWithStubImpl$Query$lessonProgressGroupedByOrg(this._res);

  TRes _res;

  call({
    Query$lessonProgressGroupedByOrg$statistics? statistics,
    String? $__typename,
  }) =>
      _res;
  CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> get statistics =>
      CopyWith$Query$lessonProgressGroupedByOrg$statistics.stub(_res);
}

const documentNodeQuerylessonProgressGroupedByOrg = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'lessonProgressGroupedByOrg'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'lessonId')),
        type: NamedTypeNode(
          name: NameNode(value: 'ID'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orgMinSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orgMaxSize')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'statistics'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'lessonProgressGroupedByOrg'),
            alias: null,
            arguments: [
              ArgumentNode(
                name: NameNode(value: 'lessonID'),
                value: VariableNode(name: NameNode(value: 'lessonId')),
              ),
              ArgumentNode(
                name: NameNode(value: 'ageGroups'),
                value: ListValueNode(values: [
                  StringValueNode(
                    value: '13 - 18',
                    isBlock: false,
                  ),
                  StringValueNode(
                    value: '19 - 25',
                    isBlock: false,
                  ),
                  StringValueNode(
                    value: '26 - 36',
                    isBlock: false,
                  ),
                ]),
              ),
              ArgumentNode(
                name: NameNode(value: 'orgMinSize'),
                value: VariableNode(name: NameNode(value: 'orgMinSize')),
              ),
              ArgumentNode(
                name: NameNode(value: 'orgMaxSize'),
                value: VariableNode(name: NameNode(value: 'orgMaxSize')),
              ),
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                name: NameNode(value: 'ProgressByOrg'),
                directives: [],
              ),
              FieldNode(
                name: NameNode(value: '__typename'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: '__typename'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      ),
      FieldNode(
        name: NameNode(value: '__typename'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      ),
    ]),
  ),
  fragmentDefinitionProgressByOrg,
]);
Query$lessonProgressGroupedByOrg _parserFn$Query$lessonProgressGroupedByOrg(
        Map<String, dynamic> data) =>
    Query$lessonProgressGroupedByOrg.fromJson(data);

class Options$Query$lessonProgressGroupedByOrg
    extends graphql.QueryOptions<Query$lessonProgressGroupedByOrg> {
  Options$Query$lessonProgressGroupedByOrg({
    String? operationName,
    required Variables$Query$lessonProgressGroupedByOrg variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    Duration? pollInterval,
    graphql.Context? context,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          pollInterval: pollInterval,
          context: context,
          document: documentNodeQuerylessonProgressGroupedByOrg,
          parserFn: _parserFn$Query$lessonProgressGroupedByOrg,
        );
}

class WatchOptions$Query$lessonProgressGroupedByOrg
    extends graphql.WatchQueryOptions<Query$lessonProgressGroupedByOrg> {
  WatchOptions$Query$lessonProgressGroupedByOrg({
    String? operationName,
    required Variables$Query$lessonProgressGroupedByOrg variables,
    graphql.FetchPolicy? fetchPolicy,
    graphql.ErrorPolicy? errorPolicy,
    graphql.CacheRereadPolicy? cacheRereadPolicy,
    Object? optimisticResult,
    graphql.Context? context,
    Duration? pollInterval,
    bool? eagerlyFetchResults,
    bool carryForwardDataOnException = true,
    bool fetchResults = false,
  }) : super(
          variables: variables.toJson(),
          operationName: operationName,
          fetchPolicy: fetchPolicy,
          errorPolicy: errorPolicy,
          cacheRereadPolicy: cacheRereadPolicy,
          optimisticResult: optimisticResult,
          context: context,
          document: documentNodeQuerylessonProgressGroupedByOrg,
          pollInterval: pollInterval,
          eagerlyFetchResults: eagerlyFetchResults,
          carryForwardDataOnException: carryForwardDataOnException,
          fetchResults: fetchResults,
          parserFn: _parserFn$Query$lessonProgressGroupedByOrg,
        );
}

class FetchMoreOptions$Query$lessonProgressGroupedByOrg
    extends graphql.FetchMoreOptions {
  FetchMoreOptions$Query$lessonProgressGroupedByOrg({
    required graphql.UpdateQuery updateQuery,
    required Variables$Query$lessonProgressGroupedByOrg variables,
  }) : super(
          updateQuery: updateQuery,
          variables: variables.toJson(),
          document: documentNodeQuerylessonProgressGroupedByOrg,
        );
}

extension ClientExtension$Query$lessonProgressGroupedByOrg
    on graphql.GraphQLClient {
  Future<graphql.QueryResult<Query$lessonProgressGroupedByOrg>>
      query$lessonProgressGroupedByOrg(
              Options$Query$lessonProgressGroupedByOrg options) async =>
          await this.query(options);
  graphql.ObservableQuery<Query$lessonProgressGroupedByOrg>
      watchQuery$lessonProgressGroupedByOrg(
              WatchOptions$Query$lessonProgressGroupedByOrg options) =>
          this.watchQuery(options);
  void writeQuery$lessonProgressGroupedByOrg({
    required Query$lessonProgressGroupedByOrg data,
    required Variables$Query$lessonProgressGroupedByOrg variables,
    bool broadcast = true,
  }) =>
      this.writeQuery(
        graphql.Request(
          operation: graphql.Operation(
              document: documentNodeQuerylessonProgressGroupedByOrg),
          variables: variables.toJson(),
        ),
        data: data.toJson(),
        broadcast: broadcast,
      );
  Query$lessonProgressGroupedByOrg? readQuery$lessonProgressGroupedByOrg({
    required Variables$Query$lessonProgressGroupedByOrg variables,
    bool optimistic = true,
  }) {
    final result = this.readQuery(
      graphql.Request(
        operation: graphql.Operation(
            document: documentNodeQuerylessonProgressGroupedByOrg),
        variables: variables.toJson(),
      ),
      optimistic: optimistic,
    );
    return result == null
        ? null
        : Query$lessonProgressGroupedByOrg.fromJson(result);
  }
}

graphql_flutter.QueryHookResult<Query$lessonProgressGroupedByOrg>
    useQuery$lessonProgressGroupedByOrg(
            Options$Query$lessonProgressGroupedByOrg options) =>
        graphql_flutter.useQuery(options);
graphql.ObservableQuery<Query$lessonProgressGroupedByOrg>
    useWatchQuery$lessonProgressGroupedByOrg(
            WatchOptions$Query$lessonProgressGroupedByOrg options) =>
        graphql_flutter.useWatchQuery(options);

class Query$lessonProgressGroupedByOrg$Widget
    extends graphql_flutter.Query<Query$lessonProgressGroupedByOrg> {
  Query$lessonProgressGroupedByOrg$Widget({
    widgets.Key? key,
    required Options$Query$lessonProgressGroupedByOrg options,
    required graphql_flutter.QueryBuilder<Query$lessonProgressGroupedByOrg>
        builder,
  }) : super(
          key: key,
          options: options,
          builder: builder,
        );
}

class Query$lessonProgressGroupedByOrg$statistics {
  Query$lessonProgressGroupedByOrg$statistics({
    required this.lessonProgressGroupedByOrg,
    required this.$__typename,
  });

  factory Query$lessonProgressGroupedByOrg$statistics.fromJson(
      Map<String, dynamic> json) {
    final l$lessonProgressGroupedByOrg = json['lessonProgressGroupedByOrg'];
    final l$$__typename = json['__typename'];
    return Query$lessonProgressGroupedByOrg$statistics(
      lessonProgressGroupedByOrg:
          (l$lessonProgressGroupedByOrg as List<dynamic>)
              .map((e) =>
                  Fragment$ProgressByOrg.fromJson((e as Map<String, dynamic>)))
              .toList(),
      $__typename: (l$$__typename as String),
    );
  }

  final List<Fragment$ProgressByOrg> lessonProgressGroupedByOrg;

  final String $__typename;

  Map<String, dynamic> toJson() {
    final _resultData = <String, dynamic>{};
    final l$lessonProgressGroupedByOrg = lessonProgressGroupedByOrg;
    _resultData['lessonProgressGroupedByOrg'] =
        l$lessonProgressGroupedByOrg.map((e) => e.toJson()).toList();
    final l$$__typename = $__typename;
    _resultData['__typename'] = l$$__typename;
    return _resultData;
  }

  @override
  int get hashCode {
    final l$lessonProgressGroupedByOrg = lessonProgressGroupedByOrg;
    final l$$__typename = $__typename;
    return Object.hashAll([
      Object.hashAll(l$lessonProgressGroupedByOrg.map((v) => v)),
      l$$__typename,
    ]);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (!(other is Query$lessonProgressGroupedByOrg$statistics) ||
        runtimeType != other.runtimeType) {
      return false;
    }
    final l$lessonProgressGroupedByOrg = lessonProgressGroupedByOrg;
    final lOther$lessonProgressGroupedByOrg = other.lessonProgressGroupedByOrg;
    if (l$lessonProgressGroupedByOrg.length !=
        lOther$lessonProgressGroupedByOrg.length) {
      return false;
    }
    for (int i = 0; i < l$lessonProgressGroupedByOrg.length; i++) {
      final l$lessonProgressGroupedByOrg$entry =
          l$lessonProgressGroupedByOrg[i];
      final lOther$lessonProgressGroupedByOrg$entry =
          lOther$lessonProgressGroupedByOrg[i];
      if (l$lessonProgressGroupedByOrg$entry !=
          lOther$lessonProgressGroupedByOrg$entry) {
        return false;
      }
    }
    final l$$__typename = $__typename;
    final lOther$$__typename = other.$__typename;
    if (l$$__typename != lOther$$__typename) {
      return false;
    }
    return true;
  }
}

extension UtilityExtension$Query$lessonProgressGroupedByOrg$statistics
    on Query$lessonProgressGroupedByOrg$statistics {
  CopyWith$Query$lessonProgressGroupedByOrg$statistics<
          Query$lessonProgressGroupedByOrg$statistics>
      get copyWith => CopyWith$Query$lessonProgressGroupedByOrg$statistics(
            this,
            (i) => i,
          );
}

abstract class CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> {
  factory CopyWith$Query$lessonProgressGroupedByOrg$statistics(
    Query$lessonProgressGroupedByOrg$statistics instance,
    TRes Function(Query$lessonProgressGroupedByOrg$statistics) then,
  ) = _CopyWithImpl$Query$lessonProgressGroupedByOrg$statistics;

  factory CopyWith$Query$lessonProgressGroupedByOrg$statistics.stub(TRes res) =
      _CopyWithStubImpl$Query$lessonProgressGroupedByOrg$statistics;

  TRes call({
    List<Fragment$ProgressByOrg>? lessonProgressGroupedByOrg,
    String? $__typename,
  });
  TRes lessonProgressGroupedByOrg(
      Iterable<Fragment$ProgressByOrg> Function(
              Iterable<CopyWith$Fragment$ProgressByOrg<Fragment$ProgressByOrg>>)
          _fn);
}

class _CopyWithImpl$Query$lessonProgressGroupedByOrg$statistics<TRes>
    implements CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> {
  _CopyWithImpl$Query$lessonProgressGroupedByOrg$statistics(
    this._instance,
    this._then,
  );

  final Query$lessonProgressGroupedByOrg$statistics _instance;

  final TRes Function(Query$lessonProgressGroupedByOrg$statistics) _then;

  static const _undefined = {};

  TRes call({
    Object? lessonProgressGroupedByOrg = _undefined,
    Object? $__typename = _undefined,
  }) =>
      _then(Query$lessonProgressGroupedByOrg$statistics(
        lessonProgressGroupedByOrg: lessonProgressGroupedByOrg == _undefined ||
                lessonProgressGroupedByOrg == null
            ? _instance.lessonProgressGroupedByOrg
            : (lessonProgressGroupedByOrg as List<Fragment$ProgressByOrg>),
        $__typename: $__typename == _undefined || $__typename == null
            ? _instance.$__typename
            : ($__typename as String),
      ));
  TRes lessonProgressGroupedByOrg(
          Iterable<Fragment$ProgressByOrg> Function(
                  Iterable<
                      CopyWith$Fragment$ProgressByOrg<Fragment$ProgressByOrg>>)
              _fn) =>
      call(
          lessonProgressGroupedByOrg: _fn(_instance.lessonProgressGroupedByOrg
              .map((e) => CopyWith$Fragment$ProgressByOrg(
                    e,
                    (i) => i,
                  ))).toList());
}

class _CopyWithStubImpl$Query$lessonProgressGroupedByOrg$statistics<TRes>
    implements CopyWith$Query$lessonProgressGroupedByOrg$statistics<TRes> {
  _CopyWithStubImpl$Query$lessonProgressGroupedByOrg$statistics(this._res);

  TRes _res;

  call({
    List<Fragment$ProgressByOrg>? lessonProgressGroupedByOrg,
    String? $__typename,
  }) =>
      _res;
  lessonProgressGroupedByOrg(_fn) => _res;
}
