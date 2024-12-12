enum TaskType {
  lecture("Lecture"),
  exercise("Exercise"),
  general("General"),
  other("Other");

  final String _type;

  const TaskType(this._type);

  String get type => _type;
}
