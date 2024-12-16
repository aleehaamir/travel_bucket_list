import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:travel_bucket_list/models/city_model.dart';
import 'package:travel_bucket_list/models/user_model.dart';
import 'package:travel_bucket_list/screens/about_us/about_us_screen.dart';
import 'package:travel_bucket_list/screens/bucket/bucket_list_screen.dart';
import 'package:travel_bucket_list/screens/bucket/checkout_screen.dart';
import 'package:travel_bucket_list/screens/history/history_screen.dart';
import 'package:travel_bucket_list/screens/home/home_screen.dart';


import 'screens/auth/login_screen.dart'; // Import your LoginScreen
import 'screens/auth/registration_screen.dart'; // Import your RegistrationScreen
 // Import BucketListScreen
 // Import your HomeScreen
import 'screens/splash/splash_screen.dart'; // Import your SplashScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(UserModelAdapter())
    ..registerAdapter(BucketModelAdapter())
    ..registerAdapter(CityModelAdapter())
    ..registerAdapter(HotelAdapter());
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
        '/checkout': (context) => CheckoutScreen(totalAmount: 0,
              city: CityModel(name: '', image: '',hotels:[]
            ),)
      },
    );
  }
}
