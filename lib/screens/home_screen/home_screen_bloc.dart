import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_weather_app/api/api_client.dart';
import 'package:forecast_weather_app/entity/city/city.dart';
import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';

import 'home_screen_event.dart';
import 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(StartHomeScreenState()) {
    on<OnChangedHomeScreenEvent>(_onChange);
    on<NavigationHomeScreenEvent>(_navigation);
  }

  String city = '';

  void _onChange(OnChangedHomeScreenEvent event, _) {
    city = event.text;
  }

  void _navigation(
      NavigationHomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    try {
      late List<CityCoordinate> cityCoordinate;
      cityCoordinate = await ApiClient().getCityCoordinate(city, 1);
      print(cityCoordinate);
      CityWeather cityWeather = await ApiClient()
          .getCityWeather(cityCoordinate.first.lat, cityCoordinate.first.lon);
      emit(NavigationHomeScreenState(cityWeather: cityWeather));
    } catch (e) {

      print(e);
      print(e.runtimeType);
      emit(ErrorHomeScreenState(e.toString()));
    }
  }
}
