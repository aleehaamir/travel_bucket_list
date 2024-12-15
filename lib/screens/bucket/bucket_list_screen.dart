import 'package:flutter/material.dart';
import 'package:travel_bucket_list/models/city_model.dart';
import 'package:travel_bucket_list/screens/bucket/service/bucket_service.dart';

import 'city_selection_screen.dart';

class BucketListScreen extends StatefulWidget {
  const BucketListScreen({Key? key}) : super(key: key);

  @override
  State<BucketListScreen> createState() => _BucketListScreenState();
}

class _BucketListScreenState extends State<BucketListScreen>
    with BucketService {
  List<CityModel> bucketList = [];

  // Store trips in a list

  @override
  void initState() {
    super.initState();
    getBucket();
  }

  void getBucket() async {
    bucketList = await getBucketService(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bucket List',
          style: TextStyle(color: Colors.white), // AppBar text color
        ),
        backgroundColor: Colors.teal, // Theme color for AppBar
        iconTheme:
            const IconThemeData(color: Colors.white), // Back button color
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
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      trip.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.teal,
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Rs${trip.amount}",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.teal,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: trip.hotels.length * 50,
                                  // width: MediaQuery.sizeOf(context).width - 160,
                                  child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: trip.hotels.length,
                                    itemBuilder: (context, index) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Divider(),
                                        Text(
                                          trip.hotels[index].date,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black,
                                              fontSize: 12),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              trip.hotels[index].name,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                            const Spacer(),
                                            Text(
                                              "${trip.hotels[index].days} Days",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                  fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Button color
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () async {
                  // Add new trip, after selecting city and hotel
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CitySelectionScreen()),
                  );
                  if (result != null) {
                    setState(() {
                      bucketList
                          .add(result); // Add the new trip to the bucket list
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
