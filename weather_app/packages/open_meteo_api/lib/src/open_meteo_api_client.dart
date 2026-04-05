import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/models.dart';

class OpenMeteoApiClient {
  final http.Client httpClient;
  
  OpenMeteoApiClient({required this.httpClient});
  
  static const baseUrl = 'https://geocoding-api.open-meteo.com/v1';
  static const weatherBaseUrl = 'https://api.open-meteo.com/v1';

  Future<Location> locationSearch(String city) async {
    final url = Uri.parse('$baseUrl/search?name=$city&count=1&language=en&format=json');
    final response = await httpClient.get(url);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to get location');
    }
    
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final results = jsonResponse['results'] as List<dynamic>?;
    
    if (results == null || results.isEmpty) {
      throw Exception('Location not found');
    }
    
    final locationJson = results[0] as Map<String, dynamic>;
    return Location.fromJson(locationJson);
  }

  Future<Weather> getWeather(double latitude, double longitude) async {
    final url = Uri.parse(
      '$weatherBaseUrl/forecast?latitude=$latitude&longitude=$longitude&current_weather=true'
    );
    final response = await httpClient.get(url);
    
    if (response.statusCode != 200) {
      throw Exception('Failed to get weather');
    }
    
    final jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
    final currentWeather = jsonResponse['current_weather'] as Map<String, dynamic>;
    return Weather.fromJson(currentWeather);
  }
}
