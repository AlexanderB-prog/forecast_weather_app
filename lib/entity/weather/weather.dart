import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Main {
  final double temp;
  @JsonKey(name: 'feels_like')
  final double feelsLike;
  @JsonKey(name: 'temp_min')
  final double tempMin;
  @JsonKey(name: 'temp_max')
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: 'sea_level')
  final int? seaLevel;
  @JsonKey(name: 'grnd_level')
  final int? grandLevel;

  @JsonKey(name: 'temp_kf')
  final double? tempKf;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);

  Main(this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.seaLevel,
      this.grandLevel, this.humidity, this.tempKf);

  Map<String, dynamic> toJson() => _$MainToJson(this);
}

@JsonSerializable()
class WeatherElement {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherElement(this.id, this.main, this.description, this.icon);

  factory WeatherElement.fromJson(Map<String, dynamic> json) => _$WeatherElementFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherElementToJson(this);
}

@JsonSerializable()
class Clouds {
  final int all;

  Clouds(this.all);

  factory Clouds.fromJson(Map<String, dynamic> json) => _$CloudsFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsToJson(this);
}

@JsonSerializable()
class Wind {
  final double speed;
  final int deg;

  Wind(this.speed, this.deg);

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);

  Map<String, dynamic> toJson() => _$WindToJson(this);
}

@JsonSerializable()
class Coordinates {
  final double lat;
  final double lon;

  Coordinates(this.lat, this.lon);

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
