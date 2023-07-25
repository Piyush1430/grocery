import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:grocery/screen/intro.dart';

void main() {
  runApp(
    const ProviderScope(
      child: GroceriesApp(),
    ),
  );
}

class GroceriesApp extends StatelessWidget {
  const GroceriesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.notoSerifAhomTextTheme().copyWith(
          titleLarge: GoogleFonts.notoSerif(
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.notoSerif(
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.notoSerif(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const IntroPage(),
    );
  }
}
