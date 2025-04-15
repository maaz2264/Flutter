
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

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
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text(quran.getSurahName(widget.surahNum))),
      ),
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
