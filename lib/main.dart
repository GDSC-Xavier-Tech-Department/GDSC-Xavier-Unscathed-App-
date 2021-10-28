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
      home: welcomepage(),
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: kbuttonColor, backgroundColor: Colors.black12),
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
