import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';


@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CityCoordinate {
final String name;
@JsonKey(name: 'local_names')
final LocalNames localNames;
final double lat;
final double lon;
final String country;

  CityCoordinate(this.name, this.localNames, this.lat, this.lon, this.country);

factory CityCoordinate.fromJson(Map<String, dynamic> json) =>
    _$CityCoordinateFromJson(json);

Map<String, dynamic> toJson() => _$CityCoordinateToJson(this);

}


@JsonSerializable()
class LocalNames
{
  final String? en;
  final String ru;
LocalNames(this.en, this.ru);

  factory LocalNames.fromJson(Map<String, dynamic> json) =>
      _$LocalNamesFromJson(json);

  Map<String, dynamic> toJson() => _$LocalNamesToJson(this);

}

