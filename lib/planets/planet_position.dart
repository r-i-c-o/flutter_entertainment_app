import 'dart:ui';

class PlanetOffset {
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;

  final double? topAnchor;

  const PlanetOffset({this.top, this.left, this.bottom, this.right})
      : topAnchor = null;

  const PlanetOffset.anchored(
      {this.left, this.bottom, this.right, required this.topAnchor})
      : top = null;
}

class PlanetPosition {
  static const double _planetSide = 276.0;
  double? top;
  double? left;
  double? bottom;
  double? right;

  PlanetPosition({
    required Size screenSize,
    required PlanetOffset offset,
  }) {
    assert(!(offset.top == null && offset.bottom == null),
        "Top and bottom must not be both null");
    assert(!(offset.left == null && offset.right == null),
        "Left and right must not be both null");
    top = offset.top;
    bottom = offset.bottom;
    left = offset.left;
    right = offset.right;

    double defaultTopBottom = screenSize.height - _planetSide;
    double defaultLeftRight = screenSize.width - _planetSide;

    if (top == null && bottom != null) {
      double? topAnchor = offset.topAnchor;
      if (topAnchor != null)
        top = screenSize.height * topAnchor;
      else
        top = defaultTopBottom - bottom!;
    } else if (top != null && bottom == null) bottom = defaultTopBottom - top!;
    if (left == null && right != null)
      left = defaultLeftRight - right!;
    else if (left != null && right == null) right = defaultLeftRight - left!;
  }
}
