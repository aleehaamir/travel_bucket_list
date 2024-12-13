import 'package:flutter/material.dart';
import 'package:travel_bucket_list/Data/hotels_data.dart';

import 'hotel_selection_screen.dart';

class CitySelectionScreen extends StatelessWidget {
  const CitySelectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select City',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Theme color for AppBar
        iconTheme:
            const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Background color
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: citiesList().length,
          itemBuilder: (context, index) {
            final city = citiesList()[index];
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
                    city.image,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  city.name,
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
                      builder: (context) => HotelSelectionScreen(city: city),
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
