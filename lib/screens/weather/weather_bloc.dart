import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_weather_app/api/api_client.dart';
import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

import 'weather_event.dart';
import 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(StartCityWeatherState()) {
    on<DetailsEvent>(_details);
    on<PopEvent>(_pop);
  }

  void _details(DetailsEvent event, Emitter<WeatherState> emit) async {
    CityForecastWeather cityForecastWeather = await ApiClient().getCityForecastWeather(event.id);
    double minTemp = cityForecastWeather.list.first.main.temp;
    ListElement minElement = cityForecastWeather.list.first;
    for (var e in cityForecastWeather.list) {
      if (e.main.temp < minTemp) {
        minElement = e;
        minTemp = e.main.temp;
      }
    }
    cityForecastWeather.list.insert(0, minElement);
    emit(CityWeatherState(cityForecastWeather));
  }

  void _pop(PopEvent event, Emitter<WeatherState> emit) async => emit(PopWeatherState());
}
