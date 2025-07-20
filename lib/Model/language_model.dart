class Languages {
  final String name;
  final String code;

  Languages({required this.name, required this.code});

  // 🔑 Required: so dropdown recognizes matching values
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Languages && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}