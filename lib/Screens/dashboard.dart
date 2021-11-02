import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'homepage.dart';
import 'profile.dart';
import 'settings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

//index of the current page
int pageIndex = 0;

//list of screen widgets
List Screens = [
  homepage(),
  Profile(),
  Settings(),
];

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Screens[
            pageIndex], //will set the screen based on the Screens list using the current page index
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: kdarkbuttonColor,
          iconSize: 30,
          onTap: (index) => setState(() => pageIndex = index),
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
