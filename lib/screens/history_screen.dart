import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visitedDestinations = [
      {
        'name': 'Paris, France',
        'image': 'assets/images/paris.jpg',
        'date': 'Visited: June 2023',
      },
      {
        'name': 'Tokyo, Japan',
        'image': 'assets/images/tokyo.jpg',
        'date': 'Visited: April 2023',
      },
      {
        'name': 'Sydney, Australia',
        'image': 'assets/images/sydney.jpg',
        'date': 'Visited: January 2023',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travel History',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Theme color
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Screen background color
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: visitedDestinations.length,
          itemBuilder: (context, index) {
            final destination = visitedDestinations[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              margin: const EdgeInsets.only(bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(8.0),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    destination['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  destination['name']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                subtitle: Text(
                  destination['date']!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                trailing: const Icon(Icons.check_circle, color: Colors.teal),
              ),
            );
          },
        ),
      ),
    );
  }
}
