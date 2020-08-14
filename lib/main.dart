import 'package:flutter/material.dart';
import 'package:flutter_stock_listing/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: GoogleFonts.cabin(),
          unselectedLabelStyle: GoogleFonts.cabin(),
        ),
      ),
      home: HomePage(),
    );
  }
}

