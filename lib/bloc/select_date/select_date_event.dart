abstract class SelectDateEvent {}

class NavigateToResultEvent extends SelectDateEvent {
  NavigateToResultEvent(this.year);
  final int year;
}
