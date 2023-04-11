abstract class WeatherEvent {}

class InitEvent extends WeatherEvent {}

class DetailsEvent extends WeatherEvent {
  final int id;

  DetailsEvent(this.id);

}

class PopEvent extends WeatherEvent {}






