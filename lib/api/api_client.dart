import 'dart:async'; //импорт библиотеки для работы с асинхронными запросами
import 'dart:convert'; //импорт библиотеки для работы с json
import 'dart:io'; // импорт библиотеки для сетевых запросов

//подключение файлов в которых описаны классы городаБ погоды и т.д.
import 'package:forecast_weather_app/entity/city/city.dart';
import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';
import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

//класс для запросов к серверу
class ApiClient {
  final _client = HttpClient(); //создание экземпляра HttpClient
  static const _hostWeather = 'https://api.openweathermap.org/data/2.5'; //путь к api с погодой
  static const _hostCityCoordinate =
      'http://api.openweathermap.org/geo/1.0'; // путь к api с получением координат по названию города
  static const _apiKey = '17d71400c741c58d1c57fb10416e6215'; // мой ключ для api openweathermap

  //получение координат города
  Future<List<CityCoordinate>> getCityCoordinate(String cityName, int limit) async {
    String path =
        '/direct?q=$cityName&limit=$limit&lang=ru&appid=$_apiKey'; // собирается путь с учетом доп параметров: название города, кол-во локаций в ответе запроса, ключ
    final uri =
        Uri.parse('$_hostCityCoordinate$path'); // осздаю нвоый объект uri  по собранной ссылке
    final request =
        await _client.getUrl(uri); // собирается запрос и открывается коннект использую метод GET
    final response =
        await request.close(); //закрытие коннекта и получение ответа от сервера на запрос
    final json = (await response.jsonDecode()) as List<dynamic>;
    return json.map((e) => CityCoordinate.fromJson(e)).toList();
  }

  //получение погоды в нужном городе по координатам
  Future<CityWeather> getCityWeather(double lat, double lon) async {
    String path = '/weather?lat=$lat&lon=$lon&lang=ru&appid=$_apiKey';
    final url = Uri.parse('$_hostWeather$path');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    return CityWeather.fromJson(json);
  }

  // получение прогноза погоды на 3 дня вперед по id города
  Future<CityForecastWeather> getCityForecastWeather(int id) async {
    String path =
        '/forecast?id=$id&cnt=${(8 - (DateTime.now().hour / 3).floor()) + 24}&lang=ru&appid=$_apiKey'; //указывается кол-во интервалов? что бы отобразить погоду сегодня доконца дня + 3 суток
    final url = Uri.parse('$_hostWeather$path');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    return CityForecastWeather.fromJson(json);
  }
}

//создание расширения для удобного преобразования формата json
extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
