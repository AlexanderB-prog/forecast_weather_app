import 'package:json_annotation/json_annotation.dart';
import 'package:forecast_weather_app/entity/weather/weather.dart';

part 'forecast_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class CityForecastWeather {
  final String cod;
  final int message;
  final int cnt;
  final List<ListElement> list;
  final City city;

  CityForecastWeather(this.cod, this.message, this.cnt, this.list, this.city);

  factory CityForecastWeather.fromJson(Map<String, dynamic> json) =>
      _$CityForecastWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityForecastWeatherToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ListElement {
  final int dt;
  final Main main;
  final List<WeatherElement> weather;
  final Clouds clouds;
  final Wind wind;
  final int visibility;
  final double pop;
  final Sys sys;
  @JsonKey(name: 'dt_txt')
  final String dtTxt;

  ListElement(this.dt, this.main, this.weather, this.clouds, this.wind,
      this.visibility, this.pop, this.sys, this.dtTxt);

  factory ListElement.fromJson(Map<String, dynamic> json) =>
      _$ListElementFromJson(json);

  Map<String, dynamic> toJson() => _$ListElementToJson(this);
}

@JsonSerializable()
class Sys {
  final String pod;

  Sys(this.pod);

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);

  Map<String, dynamic> toJson() => _$SysToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class City {
  final int id;
  final String name;
  @JsonKey(name: 'coord')
  final Coordinates coordinates;
  final String country;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  City(this.id, this.name, this.coordinates, this.country, this.population,
      this.timezone, this.sunrise, this.sunset);

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
