import 'package:flutter/material.dart';

import 'Backend/constants.dart';
//import 'Screens/homepage.dart';
import 'Screens/welcomepage.dart';

void main() {
  runApp(UnscathedApp());
}

class UnscathedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: welcomepage(),
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          elevation: 0,
          toolbarHeight: 60,
          backgroundColor: Color(0xff141A1F),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: kbuttonColor,
            backgroundColor: Colors.transparent),
        scaffoldBackgroundColor: kdarkBlueGrey,
      ),
    );
  }
}
