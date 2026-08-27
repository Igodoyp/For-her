import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/start_screen.dart';

void main() {
  runApp(const AnniversaryApp());
}

class AnniversaryApp extends StatelessWidget {
  const AnniversaryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Feliz Cumple Mes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: GoogleFonts.vt323TextTheme(
          Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
        ),
        useMaterial3: true,
      ),
      home: const StartScreen(),
    );
  }
}