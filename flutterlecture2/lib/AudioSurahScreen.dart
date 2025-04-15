import 'package:flutter/material.dart';
import 'package:flutterlecture2/DetailSurah.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/quran.dart' as quran;

class audiosurahscreen extends StatefulWidget {
  const audiosurahscreen({super.key});

  @override
  State<audiosurahscreen> createState() => _audiosurahscreenState();
}

class _audiosurahscreenState extends State<audiosurahscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Center(child: Text("Musaf App")),
      ),
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

            subtitle: Text(
              "مشاری راشد",
              style: TextStyle(fontFamily: "jameel", fontSize: 20),

            ),
          
            trailing:
                quran.getPlaceOfRevelation(index + 1) == "Makkah"
                    ? Image.asset(
                      "assists/images/kabba.png",
                      width: 50,
                      height: 50,
                    )
                    : Image.asset(
                      "assists/images/madina.png",
                      width: 50,
                      height: 50,
                    ),
              
          );
          
        },
      ),
    );
  }
}
