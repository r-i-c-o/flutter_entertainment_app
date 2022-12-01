class TextSize {
  final String size;
  final int index;
  static const List<String> _sizes = [
    "Small",
    "Medium",
    "Large",
  ];

  TextSize(this.index) : size = _sizes[index];

  TextSize.small() : this(0);
  TextSize.medium() : this(1);
  TextSize.large() : this(2);

  bool equals(TextSize other) {
    return other.index == index;
  }
}
