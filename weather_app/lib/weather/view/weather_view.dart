import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/weather_cubit.dart';
import '../cubit/weather_state.dart';
import 'widgets/weather_initial_view.dart';
import 'widgets/weather_loading_view.dart';
import 'widgets/weather_success_view.dart';
import 'widgets/weather_failure_view.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherStatus.initial:
            return const WeatherInitialView();
          case WeatherStatus.loading:
            return const WeatherLoadingView();
          case WeatherStatus.success:
            if (state.weather != null) {
              return WeatherSuccessView(weather: state.weather!);
            }
            return const WeatherInitialView();
          case WeatherStatus.failure:
            return const WeatherFailureView();
        }
      },
    );
  }
}
