import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

//абстрактный класс для состояний
abstract class WeatherState {}


//начальное состоние экрана с погодой
class StartCityWeatherState extends WeatherState {}

//состояние для перехода к прогнозу на 3 дня
class CityWeatherState extends WeatherState {
  final CityForecastWeather cityForecastWeather;

  CityWeatherState(this.cityForecastWeather);
}
//состония для возврата к новому поиску
class PopWeatherState extends WeatherState {}
