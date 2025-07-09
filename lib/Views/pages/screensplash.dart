import 'package:flutter/material.dart';

class Screensplash extends StatefulWidget {
  const Screensplash({super.key});

  @override
  State<Screensplash> createState() => _ScreensplashState();
}

class _ScreensplashState extends State<Screensplash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/OIP-removebg-preview.png"),
            Text("STUDY TRACKER..",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: const Color.fromARGB(255, 3, 15, 24)),)
          ],
        ),
      ),
    );
  }
}