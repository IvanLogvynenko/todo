enum Difficulty {
  easy("easy"),
  medium("medium"),
  hard("hard"),
  extreme("extreme"),
  teamWork("team work"),
  unpredictable("unpredictable");

  final String _level;

  const Difficulty(this._level);

  String get level => _level;
}
