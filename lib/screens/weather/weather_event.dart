//абстрактный класс для событий
abstract class WeatherEvent {}

//стартовое событие
class InitEvent extends WeatherEvent {}


//событие для запроса прогноза погоды на ближайшие 3 дня
class DetailsEvent extends WeatherEvent {
  final int id;

  DetailsEvent(this.id);
}

//генерация события, для нового поиска погоды по названию города
class PopEvent extends WeatherEvent {}
