import 'package:flutter/material.dart';

class TrendingDestinationsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> destinations = [
    {
      'name': 'Paris, France',
      'image': 'assets/images/paris.jpg',
      'description': 'Explore the Eiffel Tower and enjoy French cuisine.',
      'hostelInfo': 'Hotel Parisian: Rs. 12,000/night',
      'package': 'Rs. 50,000 - 3 Nights, Breakfast Included',
      'city': 'Paris',
      'hotel': 'Hotel Parisian',
    },
    {
      'name': 'Tokyo, Japan',
      'image': 'assets/images/tokyo.jpg',
      'description': 'Discover the vibrant culture of Tokyo.',
      'hostelInfo': 'Tokyo Stay: Rs. 15,000/night',
      'package': 'Rs. 70,000 - 5 Nights, Breakfast Included',
      'city': 'Tokyo',
      'hotel': 'Tokyo Stay',
    },
    {
      'name': 'Sydney, Australia',
      'image': 'assets/images/sydney.jpg',
      'description': 'Enjoy the iconic Sydney Opera House and Bondi Beach.',
      'hostelInfo': 'Sydney Harbor Hotel: Rs. 18,000/night',
      'package': 'Rs. 90,000 - 4 Nights, Breakfast Included',
      'city': 'Sydney',
      'hotel': 'Sydney Harbor Hotel',
    },
  ];

  TrendingDestinationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trending Destinations'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.asset(
                    destination['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destination['name'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(destination['description']),
                      const SizedBox(height: 8),
                      Text('🏨 ${destination['hostelInfo']}'),
                      const SizedBox(height: 8),
                      Text('💼 Package: ${destination['package']}'),
                      const SizedBox(height: 16),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 24),
                          ),
                          onPressed: () {
                            // Pass selected city, hotel, and package to CheckoutScreen
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => CheckoutScreen(
                            //       selectedCity: destination['city'],
                            //       selectedHotel: destination['hotel'],
                            //       selectedPackage: destination['package'],
                            //       nights:
                            //           3, // Default nights value (can be dynamic)
                            //       totalCost:
                            //           50000, // Default cost value (can be dynamic)
                            //     ),
                            //   ),
                            // );
                          },
                          child: const Text('Select Package'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
