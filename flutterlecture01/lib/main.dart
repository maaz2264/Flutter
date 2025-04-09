import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Introduction", style: TextStyle(fontSize: 45,color:Colors.red[900],fontWeight: FontWeight.bold),),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 10, 221, 63),
          child: Text(
            "1. Name: Muhammad Maaz \n\n"
            "2. Age: 19\n\n"
            "3. Education: i had don my matriculation from the Muhammad Academy and recently pass out from 1 year from concordia collages malir now prepearing my self for 2 year exam 2025.\n\n"
            "4. skills: i am recently larning web development online now and improving my slef daliy for this tec and modren world.\n\n"
            "5. language: Html,css half,java soon.\n\n"
            "Thank you for your concentration.😊",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
