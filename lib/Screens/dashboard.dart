import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unscathed/Backend/constants.dart';
import 'homepage.dart';
import 'profile.dart';
import 'settings.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

//index of the current page
int pageIndex = 0;

//list of screen widgets

final navBarItems = <Widget>[
  Icon(
    Icons.home,
    size: 30,
  ),
  Icon(
    Icons.person,
    size: 30,
  ),
  Icon(FontAwesomeIcons.cog)
];

List<Widget> Screens = [
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
          bottomNavigationBar: CurvedNavigationBar(
            index: pageIndex,
            onTap: (index) => setState(() => pageIndex = index),
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: kdarkColor,
            color: kbuttonColor,
            items: navBarItems,
            height: 50,
          )

          //BottomNavigationBar(
          //   backgroundColor: kdarkbuttonColor,
          //   iconSize: 30,
          //   onTap: (index) => setState(() => pageIndex = index),
          //   currentIndex: pageIndex,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.settings), label: "Settings"),
          //   ],
          // ),
          ),
    );
  }
}
