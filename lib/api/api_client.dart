import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:forecast_weather_app/entity/city/city.dart';
import 'package:forecast_weather_app/entity/city_weather/city_weather.dart';
import 'package:forecast_weather_app/entity/forecast_weather/forecast_weather.dart';

class ApiClient {
  final _client = HttpClient();
  static const _hostWeather = 'https://api.openweathermap.org/data/2.5';
  static const _hostCityCoordinate = 'http://api.openweathermap.org/geo/1.0';
  static const _apiKey = '17d71400c741c58d1c57fb10416e6215';

  Future<List<CityCoordinate>> getCityCoordinate(String cityName, int limit) async {
    String path = '/direct?q=$cityName&limit=$limit&lang=ru&appid=$_apiKey';
    final url = Uri.parse('$_hostCityCoordinate$path');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as List<dynamic>;
    return json.map((e) => CityCoordinate.fromJson(e)).toList();
  }

  Future<CityWeather> getCityWeather(double lat, double lon) async {
    String path = '/weather?lat=$lat&lon=$lon&lang=ru&appid=$_apiKey';
    final url = Uri.parse('$_hostWeather$path');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    return CityWeather.fromJson(json);
  }

  Future<CityForecastWeather> getCityForecastWeather(int id) async {
    String path =
        '/forecast?id=$id&cnt=${(8 - (DateTime.now().hour / 3).floor()) + 24}&lang=ru&appid=$_apiKey';
    final url = Uri.parse('$_hostWeather$path');
    final request = await _client.getUrl(url);
    final response = await request.close();
    final json = (await response.jsonDecode()) as Map<String, dynamic>;
    return CityForecastWeather.fromJson(json);
  }
}

extension HttpClientResponseJsonDecode on HttpClientResponse {
  Future<dynamic> jsonDecode() async {
    return transform(utf8.decoder)
        .toList()
        .then((value) => value.join())
        .then<dynamic>((v) => json.decode(v));
  }
}
