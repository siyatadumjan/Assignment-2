import 'package:flutter/foundation.dart';


@immutable
sealed class AreaCircleEvent {}

class CalculateAreaEvent extends AreaCircleEvent {
  final double radius;

  CalculateAreaEvent(this.radius);

}