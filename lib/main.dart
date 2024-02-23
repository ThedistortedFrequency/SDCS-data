import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdcs_data/complaint_details.dart';
import 'package:sdcs_data/firebase_options.dart';
import 'package:sdcs_data/utils/pages/electrification_data.dart';
import 'package:sdcs_data/utils/pages/feeddata.dart';
import 'package:sdcs_data/utils/pages/home.dart';
import 'package:sdcs_data/utils/pages/userdata.dart';
import 'package:sdcs_data/utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.indigo, textTheme: GoogleFonts.latoTextTheme()),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        Routes.complainRoute: (context) => const CompDetail(),
        Routes.electrificationRoute: (context) => const Electdata(),
        Routes.feedbackRoute: (context) => const FeedData(),
        Routes.userdetailRoute: (context) => const UserData(),
        Routes.homeRoute: (context) => const HomePage()
      },
    );
  }
}
