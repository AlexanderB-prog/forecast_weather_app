import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';
//абстрактный класс дял state
abstract class HomeScreenState {}


//state для перехода на экран с погодой и передачи данных погоды во указанному городу
class NavigationHomeScreenState extends HomeScreenState {
  final CityWeather cityWeather;

  NavigationHomeScreenState({required this.cityWeather});
}
//начальное состояние экрана
class StartHomeScreenState extends HomeScreenState {}

//состояние с текстом ошибки
class ErrorHomeScreenState extends HomeScreenState {
  final String text;

  ErrorHomeScreenState(this.text);
}
