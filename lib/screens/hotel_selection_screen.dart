import 'package:flutter/material.dart';
import 'checkout_screen.dart';

class HotelSelectionScreen extends StatefulWidget {
  final String city;

  const HotelSelectionScreen({Key? key, required this.city}) : super(key: key);

  @override
  _HotelSelectionScreenState createState() => _HotelSelectionScreenState();
}

class _HotelSelectionScreenState extends State<HotelSelectionScreen> {
  final List<Map<String, dynamic>> hotels = [
    {'name': 'Hotel Parisian', 'costPerNight': 12000},
    {'name': 'Tokyo Stay', 'costPerNight': 15000},
    {'name': 'Sydney Resort', 'costPerNight': 18000},
    {'name': 'Dubai Palace', 'costPerNight': 20000},
  ];

  String? selectedHotel;
  int nights = 1;
  int totalCost = 0;

  void _updateTotalCost() {
    if (selectedHotel != null) {
      final hotel = hotels.firstWhere((hotel) => hotel['name'] == selectedHotel);
      setState(() {
        totalCost = hotel['costPerNight'] * nights;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Hotel for ${widget.city}',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Available Hotels:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: hotels.length,
                itemBuilder: (context, index) {
                  final hotel = hotels[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        hotel['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Cost: Rs. ${hotel['costPerNight']} per night',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: selectedHotel == hotel['name']
                          ? const Icon(Icons.check_circle, color: Colors.teal)
                          : null,
                      onTap: () {
                        setState(() {
                          selectedHotel = hotel['name'];
                          _updateTotalCost();
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Nights Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nights: $nights',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (nights > 1) {
                          setState(() {
                            nights--;
                            _updateTotalCost();
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.teal),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          nights++;
                          _updateTotalCost();
                        });
                      },
                      icon: const Icon(Icons.add_circle_outline, color: Colors.teal),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Total Cost
            Text(
              'Total Cost: Rs. $totalCost',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 20),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: selectedHotel == null
                      ? null
                      : () {
                          Navigator.pop(
                            context,
                            {
                              'city': widget.city,
                              'hotel': selectedHotel,
                              'nights': nights,
                              'totalCost': totalCost,
                            },
                          );
                        },
                  child: const Text(
                    'Add to Bucket List',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: selectedHotel == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckoutScreen(
                                selectedCity: widget.city,
                                selectedHotel: selectedHotel!,
                                nights: nights,
                                totalCost: totalCost,
                                selectedPackage: '',
                              ),
                            ),
                          );
                        },
                  child: const Text(
                    'Proceed to Payment',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
