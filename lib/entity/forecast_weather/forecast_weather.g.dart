// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityForecastWeather _$CityForecastWeatherFromJson(Map<String, dynamic> json) =>
    CityForecastWeather(
      json['cod'] as String,
      json['message'] as int,
      json['cnt'] as int,
      (json['list'] as List<dynamic>)
          .map((e) => ListElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      City.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CityForecastWeatherToJson(
        CityForecastWeather instance) =>
    <String, dynamic>{
      'cod': instance.cod,
      'message': instance.message,
      'cnt': instance.cnt,
      'list': instance.list.map((e) => e.toJson()).toList(),
      'city': instance.city.toJson(),
    };

ListElement _$ListElementFromJson(Map<String, dynamic> json) => ListElement(
      json['dt'] as int,
      Main.fromJson(json['main'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      Wind.fromJson(json['wind'] as Map<String, dynamic>),
      json['visibility'] as int,
      (json['pop'] as num).toDouble(),
      Sys.fromJson(json['sys'] as Map<String, dynamic>),
      json['dt_txt'] as String,
    );

Map<String, dynamic> _$ListElementToJson(ListElement instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds.toJson(),
      'wind': instance.wind.toJson(),
      'visibility': instance.visibility,
      'pop': instance.pop,
      'sys': instance.sys.toJson(),
      'dt_txt': instance.dtTxt,
    };

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      json['pod'] as String,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'pod': instance.pod,
    };

City _$CityFromJson(Map<String, dynamic> json) => City(
      json['id'] as int,
      json['name'] as String,
      Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      json['country'] as String,
      json['population'] as int,
      json['timezone'] as int,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$CityToJson(City instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'coord': instance.coordinates.toJson(),
      'country': instance.country,
      'population': instance.population,
      'timezone': instance.timezone,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
