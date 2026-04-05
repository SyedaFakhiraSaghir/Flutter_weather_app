import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:weather_repository/weather_repository.dart';
import 'weather_state.dart';
import '../models/weather.dart';

class WeatherCubit extends HydratedCubit<WeatherState> {
  final WeatherRepository weatherRepository;
  
  WeatherCubit({required this.weatherRepository}) : super(const WeatherState());
  
  Future<void> fetchWeather(String city) async {
    if (city.isEmpty) return;
    
    emit(state.copyWith(status: WeatherStatus.loading));
    
    try {
      final weather = await weatherRepository.getWeather(city);
      emit(state.copyWith(
        status: WeatherStatus.success,
        weather: WeatherModel(
          cityName: weather.cityName,
          temperature: weather.temperature,
          conditionCode: weather.conditionCode,
          units: state.weather?.units ?? TemperatureUnits.celsius,
        ),
      ));
    } catch (e) {
      emit(state.copyWith(status: WeatherStatus.failure));
    }
  }
  
  void toggleUnits() {
    if (state.weather == null) return;
    
    final newUnits = state.weather!.units == TemperatureUnits.celsius
        ? TemperatureUnits.fahrenheit
        : TemperatureUnits.celsius;
        
    emit(state.copyWith(
      weather: WeatherModel(
        cityName: state.weather!.cityName,
        temperature: state.weather!.temperature,
        conditionCode: state.weather!.conditionCode,
        units: newUnits,
      ),
    ));
  }
  
  @override
  WeatherState? fromJson(Map<String, dynamic> json) {
    return WeatherState(
      status: WeatherStatus.values[json['status'] as int],
      weather: json['weather'] != null
          ? WeatherModel(
              cityName: json['weather']['cityName'],
              temperature: json['weather']['temperature'],
              conditionCode: json['weather']['conditionCode'],
              units: TemperatureUnits.values[json['weather']['units']],
            )
          : null,
    );
  }
  
  @override
  Map<String, dynamic>? toJson(WeatherState state) {
    return {
      'status': state.status.index,
      'weather': state.weather != null
          ? {
              'cityName': state.weather!.cityName,
              'temperature': state.weather!.temperature,
              'conditionCode': state.weather!.conditionCode,
              'units': state.weather!.units.index,
            }
          : null,
    };
  }
}
