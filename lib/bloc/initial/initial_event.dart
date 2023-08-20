import 'package:new_life_care/data/enums.dart';

abstract class InitialEvent {}

class NavigateToSelectDateEvent extends InitialEvent {
  NavigateToSelectDateEvent(this.type);
  final CareType type;
}
