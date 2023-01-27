import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(const ScoreboardApp());
}

class ScoreboardApp extends StatelessWidget {
  const ScoreboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(background: Colors.transparent),
        primarySwatch: Colors.blue,
        fontFamily: 'Work Sans',
      ),
      home: MainWidget(),
    );
  }
}

enum Tab { bigChurches, smallChurches }

class MainWidget extends HookWidget {
  MainWidget({super.key});

  final query = Future.delayed(const Duration(seconds: 5), () => true);

  @override
  Widget build(BuildContext context) {
    final tab = useState(Tab.bigChurches);
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
                          color: Color(0xffF09C44),
                        ),
                      )
                    else if (future.data != null)
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: ScoreboardList(),
                      )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: 100,
              left: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SideButton(
                    text: 'Store menighter',
                    selected: tab.value == Tab.bigChurches,
                    onTap: () => tab.value = Tab.bigChurches,
                  ),
                  const SizedBox(height: 8),
                  SideButton(
                    text: 'Små menigheter',
                    selected: tab.value == Tab.smallChurches,
                    onTap: () => tab.value = Tab.smallChurches,
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class SideButton extends HookWidget {
  const SideButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.selected,
  });

  final String text;
  final bool selected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    final hovering = useState(false);
    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        hitTestBehavior: HitTestBehavior.opaque,
        onEnter: (event) {
          hovering.value = true;
        },
        onExit: (event) => hovering.value = false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          height: 36,
          width: selected ? 250 : 180,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 24),
          decoration: BoxDecoration(
            color: selected ? const Color(0xffF09C44) : const Color(0xff799177),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xff536C5B),
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreboardList extends StatelessWidget {
  const ScoreboardList({super.key});

  @override
  Widget build(BuildContext context) {
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
                  border: Border(bottom: BorderSide(color: Color(0xffF09C44)))),
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
            ...List.generate(
                40,
                (index) => TableRow(children: [
                      Text(
                        '$index.',
                        style: listItemTextStyle,
                      ),
                      Text(
                        'Fevik',
                        style: listItemTextStyle,
                      ),
                      Text(
                        '$index%',
                        style: listItemTextStyle,
                        textAlign: TextAlign.right,
                      )
                    ]))
          ],
        ),
      ),
    );
  }
}

const tableHeaderTextStyle = TextStyle(
    color: Color(0xffF09C44),
    fontSize: 18,
    height: 3,
    fontWeight: FontWeight.bold);
const listItemTextStyle = TextStyle(
    color: Color(0xffBDDABB),
    fontSize: 18,
    height: 2,
    fontWeight: FontWeight.w500);
