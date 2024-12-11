import 'package:flutter/material.dart';
import 'city_selection_screen.dart';

class BucketListScreen extends StatefulWidget {
  const BucketListScreen({Key? key}) : super(key: key);

  @override
  State<BucketListScreen> createState() => _BucketListScreenState();
}

class _BucketListScreenState extends State<BucketListScreen> {
  List<Map<String, dynamic>> bucketList = []; // Store trips in a list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bucket List',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Theme color for AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Background color for the screen
        child: Column(
          children: [
            if (bucketList.isEmpty)
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'No trips added yet. Start adding your dream destinations!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey, // Subtle text color
                  ),
                ),
              ),
            if (bucketList.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: bucketList.length,
                  itemBuilder: (context, index) {
                    var trip = bucketList[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        title: Text(
                          trip['city'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal, // Theme color for city name
                          ),
                        ),
                        subtitle: Text(
                          'Hotel: ${trip['hotel']}, Nights: ${trip['nights']}',
                          style: const TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Rs. ${trip['totalCost']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 5),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal, // Button color
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {
                                // Proceed to checkout for the selected trip
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Proceeding with payment for ${trip['city']}',
                                    ),
                                  ),
                                );
                              },
                              child: const Text(
                                'Proceed to Payment',
                                style: TextStyle(fontSize: 14, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // Add new trip, after selecting city and hotel
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CitySelectionScreen()),
                  );
                  if (result != null) {
                    setState(() {
                      bucketList.add(result); // Add the new trip to the bucket list
                    });
                  }
                },
                child: const Text(
                  'Add New Trip',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Button text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
