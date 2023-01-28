class Scoreboard {
  final String title;
  final List<ScoreboardItem> items;

  Scoreboard({required this.title, required this.items});
}

class ScoreboardItem {
  final String name;
  final double progress;

  ScoreboardItem({required this.name, required this.progress});
}
