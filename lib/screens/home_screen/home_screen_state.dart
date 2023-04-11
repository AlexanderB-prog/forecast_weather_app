import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';

abstract class HomeScreenState {}

class NavigationHomeScreenState extends HomeScreenState {
  final CityWeather cityWeather;

  NavigationHomeScreenState({required this.cityWeather});
}

class StartHomeScreenState extends HomeScreenState {}

class ErrorHomeScreenState extends HomeScreenState {
  final String text;

  ErrorHomeScreenState(this.text);
}
