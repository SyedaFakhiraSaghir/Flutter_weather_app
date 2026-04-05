import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/weather_cubit.dart';
import '../../models/weather.dart';

class WeatherSuccessView extends StatelessWidget {
  final WeatherModel weather;
  
  const WeatherSuccessView({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<WeatherCubit>().fetchWeather(weather.cityName);
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                weather.cityName,
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                weather.temperatureString,
                style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text(
                weather.conditionString,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.thermostat),
                  const SizedBox(width: 8),
                  Text(
                    '${weather.units == TemperatureUnits.celsius ? 'Celsius' : 'Fahrenheit'}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  context.read<WeatherCubit>().toggleUnits();
                },
                icon: const Icon(Icons.swap_horiz),
                label: const Text('Toggle Units'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}