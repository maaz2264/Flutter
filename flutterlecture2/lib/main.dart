import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/translations/urdu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Musaf App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: SplashScreen(),
    );
  }
}

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

    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Surahsindexscreen(),
            ));
      },
    );
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
      backgroundColor: Colors.blue[900],
    );
  }
}

class Surahsindexscreen extends StatefulWidget {
  const Surahsindexscreen({super.key});

  @override
  State<Surahsindexscreen> createState() => _SurahsindexscreenState();
}

class _SurahsindexscreenState extends State<Surahsindexscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black45,title: Text("Musaf App"),),
      backgroundColor: Colors.lightBlueAccent,
      body: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailSurah(index + 1)),
              );
            },
            leading: CircleAvatar(child: Text("${index + 1}")),
            title: Text(
              quran.getSurahNameArabic(index + 1) +
                  " | " +
                  quran.getSurahName(index + 1),
              style: GoogleFonts.amiriQuran(),
            ),

            subtitle: Text(quran.getSurahNameEnglish(index + 1)),
          );
        },
      ),
    );
  }
}

class DetailSurah extends StatefulWidget {
  var surahNum;
  DetailSurah(this.surahNum, {super.key});

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(backgroundColor: Colors.black45 ,title: Text(quran.getSurahName(widget.surahNum),),),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: ListView.builder(
            itemCount: quran.getVerseCount(widget.surahNum),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  quran.getVerse(
                    widget.surahNum,
                    index + 1,
                    verseEndSymbol: true,
                  ),
                  textAlign: TextAlign.right,
                  style: GoogleFonts.amiri(),
                ),
                subtitle: Text(
                  quran.getVerseTranslation(
                    widget.surahNum,
                    index + 1,
                    translation: quran.Translation.urdu,
                  ),
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.notoNastaliqUrdu(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
