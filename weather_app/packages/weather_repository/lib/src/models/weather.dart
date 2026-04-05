import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String cityName;
  final double temperature;
  final int conditionCode;
  
  Weather({
    required this.cityName,
    required this.temperature,
    required this.conditionCode,
  });
  
  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
