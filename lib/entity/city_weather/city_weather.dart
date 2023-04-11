import 'package:json_annotation/json_annotation.dart';
import 'package:forecast_weather_app/entity/weather/weather.dart';

part 'city_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityWeather {
  @JsonKey(name: 'coord')
  final Coordinates coordinates;
  final List<WeatherElement> weather;
  final String base;
  final Main main;
  final int visibility;
  final Wind wind;
  final Clouds clouds;
  final int dt;
  final Sys sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  CityWeather(this.coordinates, this.weather, this.base, this.main, this.visibility, this.wind,
      this.clouds, this.dt, this.sys, this.timezone, this.id, this.name, this.cod);

  factory CityWeather.fromJson(Map<String, dynamic> json) => _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);
}

@JsonSerializable()
class Sys {
// final int type;
// final int id;
  final String country;
  final int sunrise;
  final int sunset;

  Sys(this.country, this.sunrise, this.sunset);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}
