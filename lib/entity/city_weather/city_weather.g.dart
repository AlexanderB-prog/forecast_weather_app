// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeather _$CityWeatherFromJson(Map<String, dynamic> json) => CityWeather(
      Coordinates.fromJson(json['coord'] as Map<String, dynamic>),
      (json['weather'] as List<dynamic>)
          .map((e) => WeatherElement.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['base'] as String,
      Main.fromJson(json['main'] as Map<String, dynamic>),
      json['visibility'] as int,
      Wind.fromJson(json['wind'] as Map<String, dynamic>),
      Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
      json['dt'] as int,
      Sys.fromJson(json['sys'] as Map<String, dynamic>),
      json['timezone'] as int,
      json['id'] as int,
      json['name'] as String,
      json['cod'] as int,
    );

Map<String, dynamic> _$CityWeatherToJson(CityWeather instance) =>
    <String, dynamic>{
      'coord': instance.coordinates.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.main.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind.toJson(),
      'clouds': instance.clouds.toJson(),
      'dt': instance.dt,
      'sys': instance.sys.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };

Sys _$SysFromJson(Map<String, dynamic> json) => Sys(
      json['country'] as String,
      json['sunrise'] as int,
      json['sunset'] as int,
    );

Map<String, dynamic> _$SysToJson(Sys instance) => <String, dynamic>{
      'country': instance.country,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
    };
