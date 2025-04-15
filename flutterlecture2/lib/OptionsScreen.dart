import 'package:flutter/material.dart';
import 'package:flutterlecture2/AudioSurahScreen.dart';
import 'package:flutterlecture2/SurahIndexScreen.dart';

class optionsScreen extends StatefulWidget {
  const optionsScreen({super.key});

  @override
  State<optionsScreen> createState() => _optionsScreenState();
}

class _optionsScreenState extends State<optionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blueAccent,
      body: Padding(
        padding: const EdgeInsets.all(75),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => audiosurahscreen()),
                );
              },
              child: Text("Recitation | Alafasy"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Surahsindexscreen()),
                );
              },
              child: Text("Recite Quran | Mushaf"),
            ),
          ],
        ),
      ),
    );
  }
}