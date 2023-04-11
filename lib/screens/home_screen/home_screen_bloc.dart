import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forecast_weather_app/api/api_client.dart';
import 'package:forecast_weather_app/entity/city/city.dart';
import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';

import 'home_screen_event.dart';
import 'home_screen_state.dart';

//Создание блока
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(StartHomeScreenState()) {
    on<OnChangedHomeScreenEvent>(_onChange);   //описание реакции на событие OnChangedHomeScreenEvent в рамках метода _onChange
    on<NavigationHomeScreenEvent>(_navigation);//описание реакции на событие NavigationHomeScreenEvent в рамках метода _navigation
  }

  String _city = '';  // создание приватной переменной для хранения вводимого названия города

  void _onChange(OnChangedHomeScreenEvent event, _) => _city = event.text;    //сохранение вводимого названия города


  // если запрос к api успешный, от выдает состояние с погодой, при ошибки выдает сосстояние с ошибкой
  void _navigation(NavigationHomeScreenEvent event, Emitter<HomeScreenState> emit) async {
    try {
      late List<CityCoordinate> cityCoordinate;
      cityCoordinate = await ApiClient().getCityCoordinate(_city, 1);  //вызываем api клиент и запрашивает координаты города
      CityWeather cityWeather =
          await ApiClient().getCityWeather(cityCoordinate.first.lat, cityCoordinate.first.lon); //запрашиваем по полученным координатам погоду
      emit(NavigationHomeScreenState(cityWeather: cityWeather)); //отправляет полученную погоду в состояние NavigationHomeScreenState
    } catch (e) {
      emit(ErrorHomeScreenState(e.toString()));  // отправляет впоймавнную ошибку в состояние ErrorHomeScreenState
    }
  }
}
