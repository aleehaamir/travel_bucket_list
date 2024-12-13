import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travel_bucket_list/models/user_model.dart';

import 'screens/about_us_screen.dart'; // Import AboutUsScreen
import 'screens/auth/login_screen.dart'; // Import your LoginScreen
import 'screens/auth/registration_screen.dart'; // Import your RegistrationScreen
import 'screens/bucket_list_screen.dart'; // Import BucketListScreen
import 'screens/checkout_screen.dart'; // Import CheckoutScreen
import 'screens/history_screen.dart'; // Import HistoryScreen
import 'screens/home_screen.dart'; // Import your HomeScreen
import 'screens/splash/splash_screen.dart'; // Import your SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(UserModelAdapter());
  // ..registerAdapter(ChatModelAdapter())
  // ..registerAdapter(ContentAdapter());

  runApp(const TravelBucketListApp());
}

class TravelBucketListApp extends StatelessWidget {
  const TravelBucketListApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Bucket List Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash', // Set initial route to SplashScreen
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/register': (context) => const RegistrationScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/bucket_list': (context) => const BucketListScreen(),
        '/history': (context) => const HistoryScreen(),
        '/about_us': (context) => const AboutUsScreen(),
        '/checkout': (context) => const CheckoutScreen(
              selectedCity: '', // Provide a default or placeholder value
              selectedHotel: '', // Provide a default or placeholder value
              selectedPackage: '',
              nights: 0, // Default value to avoid Null assignment
              totalCost: 0, // Default value to avoid Null assignment
            ),
      },
    );
  }
}
