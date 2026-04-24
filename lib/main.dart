import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';       // 🔥 NEW
import 'package:flutter_profile/screens/home/home_screen.dart';
import 'package:flutter_profile/screens/main/main_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';
import 'firebase_options.dart';                            // 🔥 NEW

void main() async {
  // ✅ REQUIRED: Ensure widgets binding
  WidgetsFlutterBinding.ensureInitialized();

  // ✅ REQUIRED: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  print('✅ Firebase initialized successfully!');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Portfolio',

      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        canvasColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ).apply(bodyColor: Colors.white).copyWith(
          bodyLarge: TextStyle(color: bodyTextColor),
          bodyMedium: TextStyle(color: bodyTextColor),
        ),
      ),

      home: HomeScreen(),
    );
  }
}

