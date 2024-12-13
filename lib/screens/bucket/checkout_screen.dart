import 'package:flutter/material.dart';
import 'package:travel_bucket_list/components/select_payment.dart';
import 'package:travel_bucket_list/models/hotel_model.dart';

class CheckoutScreen extends StatefulWidget {
  final City city;
  double totalAmount;

  CheckoutScreen({Key? key, required this.city, required this.totalAmount})
      : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  City selections = City(name: "", image: '', hotels: []);
  @override
  void initState() {
    super.initState();
    selections = widget.city;
    selections.hotels.removeWhere((element) => element.days == 0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: selections.hotels.length,
                itemBuilder: (context, index) => Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  widget.city.hotels[index].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            widget.city.hotels[index].address,
                            style: const TextStyle(fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${widget.city.hotels[index].price * widget.city.hotels[index].days} for ${widget.city.hotels[index].days} days",
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                          Row(
                            children: [
                              Text(
                                "From : ${widget.city.hotels[index].date}",
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const SizedBox(height: 10),
            // Total Cost
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Cost before tax:',
                  style: TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    // color: Colors.teal,
                  ),
                ),
                Text(
                  widget.totalAmount.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    // fontWeight: FontWeight.bold,
                    // color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Total Cost
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tax:',
                  style: TextStyle(
                    fontSize: 13,
                    // fontWeight: FontWeight.w400,
                    // color: Colors.black,
                  ),
                ),
                Text(
                  '00.0',
                  style: TextStyle(
                    fontSize: 13,
                    // fontWeight: FontWeight.w400,
                    // color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Total Cost
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Net Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  'Rs. ${widget.totalAmount}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showPaymentBottomSheet(context);
                // Handle payment logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Proceed with Payment',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
