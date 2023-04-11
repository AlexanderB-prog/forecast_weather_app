
//абстрактный класс для событий
abstract class HomeScreenEvent {}

//событие для запроса на переход на следующий экран
class NavigationHomeScreenEvent extends HomeScreenEvent {}

//событие для сохранение вводимого названия города
class OnChangedHomeScreenEvent extends HomeScreenEvent {
  final String text;

  OnChangedHomeScreenEvent(this.text);
}
