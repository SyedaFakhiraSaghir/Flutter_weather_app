import 'package:flutter/material.dart';

class WeatherInitialView extends StatelessWidget {
  const WeatherInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_searching, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Tap the search button to find a city',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}