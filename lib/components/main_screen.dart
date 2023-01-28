import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:study_scoreboard/components/side_button.dart';

import '../helpers/api.dart';
import '../helpers/design_system.dart';
import '../model.dart';

enum Tab { bigChurches, smallChurches }

class MainScreen extends StatefulHookWidget {
  const MainScreen({super.key, required this.password, required this.lessonId});

  final String password;
  final String lessonId;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Future<List<Scoreboard>> query;

  @override
  void initState() {
    super.initState();
    query = getScoreboards();
  }

  Future<List<Scoreboard>> getScoreboards() async {
    var api = await Api.getFromPassword(widget.password);
    var value = await api.getScoreboards(widget.lessonId);
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final tabIndex = useState(0);
    final future = useFuture(query);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/bg_tile.jpg',
                filterQuality: FilterQuality.high,
                repeat: ImageRepeat.repeat,
                scale: 1),
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, bottom: 128),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      child: Image.asset(
                        'assets/logo_mint.png',
                        gaplessPlayback: true,
                        height: 55,
                        cacheHeight: 55,
                        filterQuality: FilterQuality.medium,
                        isAntiAlias: true,
                      ),
                    ),
                    if (future.connectionState == ConnectionState.waiting)
                      const Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: CircularProgressIndicator(
                          color: SotmColors.orange,
                        ),
                      )
                    else if (future.data != null)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: ScoreboardList(future.data![tabIndex.value]),
                      )
                  ],
                ),
              )
            ],
          ),
          if (future.data != null) sidebar(future.data!, tabIndex)
        ],
      ),
    );
  }

  Widget sidebar(List<Scoreboard> scoreboards, ValueNotifier<int> tabIndex) {
    return Positioned(
      top: 100,
      left: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...scoreboards.asMap().entries.map(
                (kv) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SideButton(
                    text: kv.value.title,
                    selected: tabIndex.value == kv.key,
                    onTap: () => tabIndex.value = kv.key,
                  ),
                ),
              ),
        ],
      ),
    );
  }
}

class ScoreboardList extends StatelessWidget {
  const ScoreboardList(this.data, {super.key});

  final Scoreboard data;

  @override
  Widget build(BuildContext context) {
    debugPrint(data.toString());
    return SizedBox(
      width: 450,
      child: SelectionArea(
        child: Table(
          columnWidths: const {
            0: FixedColumnWidth(80),
            2: FixedColumnWidth(80)
          },
          children: [
            const TableRow(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: SotmColors.orange))),
              children: [
                Text(
                  'Plass',
                  style: tableHeaderTextStyle,
                ),
                Text(
                  'Menighet',
                  style: tableHeaderTextStyle,
                ),
                Text(
                  'Ajour',
                  style: tableHeaderTextStyle,
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            ...data.items.asMap().entries.map(
                  (kv) => TableRow(
                    children: [
                      Text(
                        '${kv.key + 1}.',
                        style: listItemTextStyle,
                      ),
                      Text(
                        kv.value.name,
                        style: listItemTextStyle,
                      ),
                      Text(
                        '${(kv.value.progress * 100).roundToDouble()}%',
                        style: listItemTextStyle,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}

const tableHeaderTextStyle = TextStyle(
    color: SotmColors.orange,
    fontSize: 18,
    height: 3,
    fontWeight: FontWeight.bold);
const listItemTextStyle = TextStyle(
    color: SotmColors.textGreen,
    fontSize: 18,
    height: 2,
    fontWeight: FontWeight.w500);
