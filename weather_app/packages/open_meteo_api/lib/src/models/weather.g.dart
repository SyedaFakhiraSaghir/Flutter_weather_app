// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) => Weather(
      temperature: (json['temperature'] as num).toDouble(),
      weathercode: (json['weathercode'] as num).toInt(),
      windspeed: (json['windspeed'] as num).toDouble(),
      winddirection: (json['winddirection'] as num).toInt(),
    );

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'temperature': instance.temperature,
      'weathercode': instance.weathercode,
      'windspeed': instance.windspeed,
      'winddirection': instance.winddirection,
    };
