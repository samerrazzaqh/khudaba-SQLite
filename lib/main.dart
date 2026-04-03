import 'package:flutter/material.dart';

import 'Views/AboutPage.dart';
import 'Views/HomePage.dart';
import 'Views/ListAll.dart';
import 'Views/ListFavort.dart';
import 'Views/TapListMain.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),

      routes: {
        "HomePage": (context) => const HomePage(),
        "ListTapMainPage": (context) => const ListTapMainPage(),
        "ListAllPage": (context) => const ListAllPage(),
        "ListFavPage": (context) => const ListFavPage(),
        "AboutPage": (context) => const AboutPage(),
      },


    );
  }
}
