import 'package:flutter/material.dart';
import 'hotel_selection_screen.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> cities = [
      {'name': 'Paris', 'image': 'assets/images/paris.jpg'},
      {'name': 'Dubai', 'image': 'assets/images/dubai.jpg'},
      {'name': 'New York', 'image': 'assets/images/new_york.jpg'},
      {'name': 'Tokyo', 'image': 'assets/images/tokyo.jpg'},
      {'name': 'Cario', 'image': 'assets/images/cairo.jpg'},
      {'name': 'London', 'image': 'assets/images/london.jpg'},
      {'name': 'Sydney', 'image': 'assets/images/sydney.jpg'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select City',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Theme color for AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Background color
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: cities.length,
          itemBuilder: (context, index) {
            final city = cities[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              child: ListTile(
                contentPadding: const EdgeInsets.all(16),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    city['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  city['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                trailing: const Icon(Icons.arrow_forward, color: Colors.teal),
                onTap: () {
                  // Navigate to hotel selection screen after selecting a city
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelSelectionScreen(city: city['name']!),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
