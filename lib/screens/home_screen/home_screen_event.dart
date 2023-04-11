abstract class HomeScreenEvent {}

class NavigationHomeScreenEvent extends HomeScreenEvent {}

class OnChangedHomeScreenEvent extends HomeScreenEvent {
  final String text;

  OnChangedHomeScreenEvent(this.text);
}
