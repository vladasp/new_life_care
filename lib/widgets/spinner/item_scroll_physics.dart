import 'dart:math';

import 'package:flutter/material.dart';

class ItemScrollPhysics extends ScrollPhysics {
  const ItemScrollPhysics({
    super.parent,
    this.itemHeight,
    this.targetPixelsLimit = 3.0,
  });

  final double? itemHeight;
  final double targetPixelsLimit;

  @override
  ItemScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return ItemScrollPhysics(
      parent: buildParent(ancestor),
      itemHeight: itemHeight,
    );
  }

  double _getItem(ScrollPosition position) {
    final maxScrollItem =
        (position.maxScrollExtent / itemHeight!).floorToDouble();
    return min(max(0, position.pixels / itemHeight!), maxScrollItem);
  }

  double _getPixels(ScrollPosition position, double item) {
    return item * itemHeight!;
  }

  double _getTargetPixels(
    ScrollPosition position,
    Tolerance tolerance,
    double velocity,
  ) {
    var item = _getItem(position);
    if (velocity < -tolerance.velocity) {
      item -= targetPixelsLimit;
    } else if (velocity > tolerance.velocity) {
      item += targetPixelsLimit;
    }
    return _getPixels(position, item.roundToDouble());
  }

  @override
  Simulation? createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    // ignore: deprecated_member_use
    final tolerance = this.tolerance;
    final target =
        _getTargetPixels(position as ScrollPosition, tolerance, velocity);
    if (target != position.pixels) {
      return ScrollSpringSimulation(
        spring,
        position.pixels,
        target,
        velocity,
        tolerance: tolerance,
      );
    }
    return null;
  }

  @override
  bool get allowImplicitScrolling => false;
}
