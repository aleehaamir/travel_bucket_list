import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_bucket_list/components/date_time_picker.dart';
import 'package:travel_bucket_list/models/city_model.dart';

import 'checkout_screen.dart';

class HotelSelectionScreen extends StatefulWidget {
  final CityModel city;

  const HotelSelectionScreen({Key? key, required this.city}) : super(key: key);

  @override
  _HotelSelectionScreenState createState() => _HotelSelectionScreenState();
}

class _HotelSelectionScreenState extends State<HotelSelectionScreen> {
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    for (var ele in widget.city.hotels) {
      ele.days = 0;
      ele.date = '';
    }
  }

  void calculateTotal(double amount, bool add) {
    if (add) {
      totalAmount = totalAmount + amount;
    } else {
      totalAmount = totalAmount - amount;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Hotel for ${widget.city.name}',
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
                itemCount: widget.city.hotels.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (widget.city.hotels[index].date == '') {
                        showIOSDateTimePicker(
                            context: context,
                            onDateTimePicked: (date) {
                              widget.city.hotels[index].date =
                                  DateFormat('d MMM yyyy  hh:mm a')
                                      .format(date);
                              setState(() {});
                            });
                      } else {
                        widget.city.hotels[index].days++;
                        calculateTotal(widget.city.hotels[index].price, true);
                      }
                    },
                    child: Card(
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
                                  Icon(
                                    Icons.check_circle,
                                    color: widget.city.hotels[index].days == 0
                                        ? Colors.transparent
                                        : Colors.green,
                                  ),
                                ],
                              ),
                              Text(
                                widget.city.hotels[index].address,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w400),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${widget.city.hotels[index].price} / 24 Hours",
                                    style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        if (widget.city.hotels[index].days >
                                            0) {
                                          widget.city.hotels[index].days--;
                                          calculateTotal(
                                              widget.city.hotels[index].price,
                                              false);
                                        }
                                      },
                                      child: Icon(
                                        Icons.remove_circle_outline,
                                        color:
                                            widget.city.hotels[index].days == 0
                                                ? Colors.black.withOpacity(0.3)
                                                : Colors.black,
                                      )),
                                  SizedBox(
                                    width: 20,
                                    child: Center(
                                      child: Text(
                                        widget.city.hotels[index].days
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        if (widget.city.hotels[index].date ==
                                            '') {
                                          showIOSDateTimePicker(
                                              context: context,
                                              onDateTimePicked: (date) {
                                                widget.city.hotels[index]
                                                    .date = DateFormat(
                                                        'd MMM yyyy  hh:mm a')
                                                    .format(date);
                                                setState(() {});
                                              });
                                        } else {
                                          widget.city.hotels[index].days++;
                                          calculateTotal(
                                              widget.city.hotels[index].price,
                                              true);
                                        }
                                      },
                                      child:
                                          const Icon(Icons.add_circle_outline)),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  showIOSDateTimePicker(
                                      context: context,
                                      onDateTimePicked: (date) {
                                        widget.city.hotels[index].date =
                                            DateFormat('d MMM yyyy  hh:mm a')
                                                .format(date);
                                        setState(() {});
                                      });
                                },
                                borderRadius: BorderRadius.circular(5),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.teal,
                                      ),
                                      Text(
                                        widget.city.hotels[index].date == ''
                                            ? "Select date"
                                            : widget.city.hotels[index].date,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  );
                },
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
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  'Rs. $totalAmount',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Buttons
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    widget.city.hotels.any((element) => element.days != 0)
                        ? Colors.teal
                        : Colors.teal.withOpacity(0.2),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: !widget.city.hotels.any((element) => element.days != 0)
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                            city: widget.city,
                            totalAmount: totalAmount,
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
      ),
    );
  }
}
