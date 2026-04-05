import 'package:flutter/material.dart';

class WeatherFailureView extends StatelessWidget {
  const WeatherFailureView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          SizedBox(height: 16),
          Text(
            'Failed to fetch weather',
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          SizedBox(height: 8),
          Text('Please check the city name and try again'),
        ],
      ),
    );
  }
}