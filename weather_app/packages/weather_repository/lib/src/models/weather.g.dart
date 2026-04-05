// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      cityName: json['cityName'] as String,
      temperature: (json['temperature'] as num).toDouble(),
      conditionCode: (json['conditionCode'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'cityName': instance.cityName,
      'temperature': instance.temperature,
      'conditionCode': instance.conditionCode,
    };
