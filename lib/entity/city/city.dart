import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

//описание класса для города и его координат
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityCoordinate {
  final String name;
  @JsonKey(name: 'local_names')   //для переименование переменной из Json, что бы использовать название переменной по принятым стандартам
  final LocalNames localNames;
  final double lat;
  final double lon;
  final String country;

  CityCoordinate(this.name, this.localNames, this.lat, this.lon, this.country); //конструктор класса

  factory CityCoordinate.fromJson(Map<String, dynamic> json) => _$CityCoordinateFromJson(json);   //для получения объекта из json

  Map<String, dynamic> toJson() => _$CityCoordinateToJson(this);   // для сбора json из объекта класса
}
//класс с локалями, оставил минимальный набор
@JsonSerializable()
class LocalNames {
  final String? en;
  final String? ru;

  LocalNames(this.en, this.ru);

  factory LocalNames.fromJson(Map<String, dynamic> json) => _$LocalNamesFromJson(json);

  Map<String, dynamic> toJson() => _$LocalNamesToJson(this);
}
