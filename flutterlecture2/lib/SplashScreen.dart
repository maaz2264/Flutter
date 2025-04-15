import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterlecture2/OptionsScreen.dart';
import 'package:flutterlecture2/main.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => optionsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "مصحف",
          style: GoogleFonts.amiriQuran(fontSize: 45, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.purple[900],
    );
  }
}
