import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'City Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
              ),
              onSubmitted: (value) {
                Navigator.pop(context, value);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Navigator.pop(context, _controller.text);
                }
              },
              child: const Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}