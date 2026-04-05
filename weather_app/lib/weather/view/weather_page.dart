import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/weather_cubit.dart';
import 'weather_view.dart';
import '../../search_page.dart';
import '../../settings_page.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SettingsPage()),
              );
            },
          ),
        ],
      ),
      body: const WeatherView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final city = await Navigator.push<String>(
            context,
            MaterialPageRoute(builder: (_) => const SearchPage()),
          );
          if (city != null && city.isNotEmpty) {
            context.read<WeatherCubit>().fetchWeather(city);
          }
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
