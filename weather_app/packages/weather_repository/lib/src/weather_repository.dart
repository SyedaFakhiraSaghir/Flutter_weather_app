import 'package:open_meteo_api/open_meteo_api.dart' as api;
import 'models/weather.dart';

class WeatherRepository {
  final api.OpenMeteoApiClient apiClient;
  
  WeatherRepository({required this.apiClient});
  
  Future<Weather> getWeather(String cityName) async {
    try {
      final location = await apiClient.locationSearch(cityName);
      final weather = await apiClient.getWeather(location.latitude, location.longitude);
      
      return Weather(
        cityName: location.name,
        temperature: weather.temperature,
        conditionCode: weather.weathercode,
      );
    } catch (e) {
      throw Exception('Failed to get weather: $e');
    }
  }
}
