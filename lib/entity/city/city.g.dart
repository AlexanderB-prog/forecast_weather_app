// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityCoordinate _$CityCoordinateFromJson(Map<String, dynamic> json) =>
    CityCoordinate(
      json['name'] as String,
      LocalNames.fromJson(json['local_names'] as Map<String, dynamic>),
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['country'] as String,
    );

Map<String, dynamic> _$CityCoordinateToJson(CityCoordinate instance) =>
    <String, dynamic>{
      'name': instance.name,
      'local_names': instance.localNames.toJson(),
      'lat': instance.lat,
      'lon': instance.lon,
      'country': instance.country,
    };

LocalNames _$LocalNamesFromJson(Map<String, dynamic> json) => LocalNames(
      json['en'] as String?,
      json['ru'] as String?,
    );

Map<String, dynamic> _$LocalNamesToJson(LocalNames instance) =>
    <String, dynamic>{
      'en': instance.en,
      'ru': instance.ru,
    };
