import 'package:flutter/material.dart';

void showPaymentBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildPaymentOption(context, Icons.attach_money, 'Pay with Cash'),
            _buildPaymentOption(context, Icons.g_mobiledata, 'Google Pay'),
            _buildPaymentOption(context, Icons.credit_card, 'Card'),
            _buildPaymentOption(context, Icons.apple, 'Apple Pay'),
          ],
        ),
      );
    },
  );
}

Widget _buildPaymentOption(BuildContext context, IconData icon, String label) {
  return Column(
    children: [
      ListTile(
        leading: Icon(icon, size: 32, color: Colors.teal),
        title: Text(label, style: const TextStyle(fontSize: 16)),
        onTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            label == "Pay with Cash"
                ? "You selected Pay with Cash. Your booking has been confirmed."
                : "Your payment with $label has been processed successfully. Your booking has been confirmed.",
          )));
        },
      ),
      const Divider(
        height: 1,
        thickness: 1,
      ),
    ],
  );
}
