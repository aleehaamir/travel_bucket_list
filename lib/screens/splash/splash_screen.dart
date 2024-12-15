import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travel_bucket_list/HiveHelper/hive_helper_sevices.dart';
import 'package:travel_bucket_list/screens/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoAnimation;
  late final Animation<double> _textAnimation;
  int loadinglvl = 0;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 100), () {
      loadinglvl = 1;
      setState(() {});
    });
    Timer(const Duration(milliseconds: 1500), () {
      loadinglvl = 2;
      setState(() {});
    });
    // Animation controller for logo and text animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Animating logo (scaling and rotating)
    _logoAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Animating text (fade-in)
    _textAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Start animations
    _controller.forward();

    // Navigate to Registration Screen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      navigation();
    });
  }

  void navigation() async {
    bool isLogin =
        await HiveService().isExists(boxName: HiveService().currentUser);
    if (isLogin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue.shade800, Colors.blue.shade400],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Animated Circular Logo (Scaling and rotating)
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _logoAnimation.value + 0.5, // Scaling effect
                  child: Transform.rotate(
                    angle:
                        _logoAnimation.value * 2 * 3.14159, // Rotation effect
                    child: ClipOval(
                      // Clipping the logo into a circle
                      child: child,
                    ),
                  ),
                );
              },
              child: Image.asset(
                'assets/images/app_logo.jpg', // Replace with your logo path
                height: 150,
                width: 150,
              ),
            ),
            const SizedBox(height: 50),
            // Animated Text for the App name
            FadeTransition(
              opacity: _textAnimation,
              child: const Text(
                'Travel Bucket List Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1500),
                    height: 15,
                    width: loadinglvl == 2
                        ? MediaQuery.sizeOf(context).width - 42
                        : loadinglvl == 1
                            ? MediaQuery.sizeOf(context).width / 1.5
                            : 0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            // Loading indicator (spinning)
            // const CircularProgressIndicator(
            //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            // ),
          ],
        ),
      ),
    );
  }
}
