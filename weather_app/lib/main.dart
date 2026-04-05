import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_repository/weather_repository.dart';
import 'package:open_meteo_api/open_meteo_api.dart' as api;
import 'package:http/http.dart' as http;
import 'weather/cubit/weather_cubit.dart';
import 'weather/view/weather_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  
  HydratedBloc.storage = storage;
  
  final httpClient = http.Client();
  final apiClient = api.OpenMeteoApiClient(httpClient: httpClient);
  final weatherRepository = WeatherRepository(apiClient: apiClient);
  
  runApp(MyApp(weatherRepository: weatherRepository));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  
  const MyApp({super.key, required this.weatherRepository});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => WeatherCubit(weatherRepository: weatherRepository),
        child: const WeatherPage(),
      ),
    );
  }
}
