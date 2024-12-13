import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travel Trail',
          style: TextStyle(color: Colors.white), // AppBar text color white
        ),
        backgroundColor: Colors.teal, // Theme color for AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Container(
        color: Colors.white, // Screen background color
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.teal, // Matches the theme color for the header
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to Travel Bucket List Tracker! Our mission is to help you plan and track your dream travels with ease. '
              'Explore destinations, track your journey, and achieve your travel goals!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87, // Elegant text color for readability
                height: 1.5, // Line height for better text spacing
              ),
            ),
            const SizedBox(height: 30),
            // App Logo Section
            Expanded(
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'assets/images/app_logo.jpg', // Add your app logo
                    height: MediaQuery.of(context).size.height * 0.3, // Adjust logo size dynamically
                    width: MediaQuery.of(context).size.width * 0.6, // Adjust width proportionally
                    fit: BoxFit.contain, // Ensure the logo fits well
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal, // Matches theme color
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Learn More functionality coming soon!')),
                );
              },
              child: const Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }
}
