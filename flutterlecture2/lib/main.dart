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
      home: Surahsindexscreen(),
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
      backgroundColor: Colors.grey,
      body:  ListView.builder(
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
            appBar: AppBar(title: Text(quran.getSurahName(widget.surahNum)),),
      backgroundColor: Colors.grey,
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



