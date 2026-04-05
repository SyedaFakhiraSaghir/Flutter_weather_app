import 'package:equatable/equatable.dart';
import 'package:weather_repository/weather_repository.dart';

enum TemperatureUnits { celsius, fahrenheit }

class WeatherModel extends Equatable {
  final String cityName;
  final double temperature;
  final int conditionCode;
  final TemperatureUnits units;
  
  const WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.conditionCode,
    this.units = TemperatureUnits.celsius,
  });
  
  double get convertedTemperature {
    if (units == TemperatureUnits.celsius) return temperature;
    return (temperature * 9 / 5) + 32;
  }
  
  String get temperatureString => '${convertedTemperature.toStringAsFixed(0)}°';
  
  String get conditionString {
    switch (conditionCode) {
      case 0:
        return 'Clear sky';
      case 1:
      case 2:
      case 3:
        return 'Partly cloudy';
      case 45:
      case 48:
        return 'Foggy';
      case 51:
      case 53:
      case 55:
        return 'Drizzle';
      case 61:
      case 63:
      case 65:
        return 'Rain';
      case 71:
      case 73:
      case 75:
        return 'Snow';
      default:
        return 'Unknown';
    }
  }
  
  @override
  List<Object?> get props => [cityName, temperature, conditionCode, units];
}