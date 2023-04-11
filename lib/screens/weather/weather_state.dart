import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

abstract class WeatherState {}

class StartCityWeatherState extends WeatherState {}

class CityWeatherState extends WeatherState {
  final CityForecastWeather cityForecastWeather;

  CityWeatherState(this.cityForecastWeather);
}


class PopWeatherState extends WeatherState {}