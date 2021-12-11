import 'package:appmintic/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dictionary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          hintColor: primary,
          primaryColor: primary,
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: primary)),
            border: OutlineInputBorder(borderSide: BorderSide(color: primary)),
            labelStyle: TextStyle(
                color: primary, fontSize: 24.0, fontWeight: FontWeight.bold),
          )),
      home: const SplashScreen(),
    );
  }
}
