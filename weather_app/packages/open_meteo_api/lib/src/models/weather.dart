import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final double temperature;
  final int weathercode;
  final double windspeed;
  final int winddirection;

  Weather({
    required this.temperature,
    required this.weathercode,
    required this.windspeed,
    required this.winddirection,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
