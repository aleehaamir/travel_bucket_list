import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  final String selectedCity;
  final String selectedHotel;
  final int nights;
  final int totalCost;

  const CheckoutScreen({
    Key? key,
    required this.selectedCity,
    required this.selectedHotel,
    required this.nights,
    required this.totalCost, required String selectedPackage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('City: $selectedCity', style: const TextStyle(fontSize: 18)),
            Text('Hotel: $selectedHotel', style: TextStyle(fontSize: 18)),
            Text('Nights: $nights', style: TextStyle(fontSize: 18)),
            Text('Total Cost: \$${totalCost}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle payment logic here
              },
              child: const Text('Proceed with Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
