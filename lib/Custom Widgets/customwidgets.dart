import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Screens/timerpage.dart';

//FILE FOR ALL CUSTOM WIDGETS

// const customColorChecker({Key? key}) : super(key: key);
//Divider
class customDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: kbuttonColor,
      height: 15.0,
      indent: 30.0,
      endIndent: 30.0,
    );
  }
}

//customized Button with proper size
class customButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onpress;

  customButton({required this.buttonText, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45.0,
      width: 230.0,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kbuttonColor),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: onpress,
        child: Text(buttonText),
      ),
    );
  }
}

class customColorChecker extends StatefulWidget {
  bool _passwordEightCharacters = false; //password checker
  bool _hasOneNumber = false; //password checker
  bool _hasOneCapitalLetter = false;
  bool _hasOneSpecialChar = false;
  @override
  customColorCheckerState createState() => customColorCheckerState();
}

class customColorCheckerState extends State<customColorChecker> {
  @override
  Widget build(BuildContext context) {
    //TODO: REFACTOR CODE TO MAKE MORE READABLE
    colorCheck(String password) {
      final regexCheckerNumber = RegExp(r'[0-9]{1,}');
      final regexCheckerCapital = RegExp(r'[A-Z]{1,}');
      final regexCheckerSpecialCharacter = RegExp(r'[!@#$%^&*()_+{}|:"?><]');
      setState(() {
        widget._passwordEightCharacters = false;
        if (password.length >= 8) {
          widget._passwordEightCharacters = true;
        }
//works by using the onChanged function and passing in the value of the inputted password
        widget._hasOneNumber = false;
        if (regexCheckerNumber.hasMatch(password)) {
          widget._hasOneNumber = true;
        }
        widget._hasOneCapitalLetter = false;
        if (regexCheckerCapital.hasMatch(password)) {
          widget._hasOneCapitalLetter = true;
        }

        widget._hasOneSpecialChar = false;
        if (regexCheckerSpecialCharacter.hasMatch(password)) {
          widget._hasOneSpecialChar = true;
        }
      });
    }

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: widget._passwordEightCharacters
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget._passwordEightCharacters
                        ? Colors.green
                        : Colors.transparent,
                    border: widget._passwordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Contains at least 8 characters.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: widget._hasOneNumber
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget._hasOneNumber
                        ? Colors.green
                        : Colors.transparent,
                    border: widget._hasOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Must contain at least one number.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: widget._hasOneCapitalLetter
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget._hasOneCapitalLetter
                        ? Colors.green
                        : Colors.transparent,
                    border: widget._hasOneCapitalLetter
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Has at least one capital letter.'),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedContainer(
                child: widget._hasOneSpecialChar
                    ? Center(
                        child: Icon(
                          Icons.check,
                          size: 15,
                        ),
                      )
                    : Container(),
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                    color: widget._hasOneSpecialChar
                        ? Colors.green
                        : Colors.transparent,
                    border: widget._hasOneSpecialChar
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Text('Has at least one special character.'),
          ],
        ),
      ],
    );
  }
}

//round Buttons for timer page
class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        backgroundColor: kdarkbuttonColor,
        radius: 30,
        child: Icon(
          icon,
          size: 36,
          color: kbuttonColor,
        ),
      ),
    );
  }
}

//containers in Dashboard
class customDashboardContainer extends StatelessWidget {
  // const customDashboardContainer({
  //   Key? key,
  // }) : super(key: key);

  customDashboardContainer({required this.firstChild});

  Widget firstChild;
  // Widget secondChild;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Container(
        child: Row(
          children: [firstChild],
        ),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}

showCustomDialogBox(
  BuildContext context, {
  required String title,
  required String description,
}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: '',
    barrierDismissible: false,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      //dialog box animation
      return ScaleTransition(
        child: child,
        scale: Tween<double>(end: 1.0, begin: 0).animate(CurvedAnimation(
            parent: animation,
            curve: Interval(0.0, 0.50, curve: Curves.linear))),
      );
    },
    pageBuilder: (context, animation, secondaryAnimation) {
      return CustomDialogBox(title: title, description: description);
    },
  );
}

//custom dialog box for verification popup messages
class CustomDialogBox extends StatelessWidget {
  final double _borderRadius = 20;
  final String title, description;
  bool shouldPop = true;
  CustomDialogBox({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Dialog(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(_borderRadius)),
        child: Stack(
          children: <Widget>[
            Container(
              width: _width,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.only(
                  top: 24, left: 20, right: 20, bottom: 80),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(_borderRadius)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(title,
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  //divider between title and description
                  Container(
                      height: 1.5,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              12,
                              (_index) => Container(
                                    width: 6,
                                    height: 1.5,
                                    color: Colors.black,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 2),
                                  )))),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Text(description,
                        style: TextStyle(fontSize: 16, color: Colors.black)),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 0,
              child: ElevatedButton(
                clipBehavior: Clip.antiAlias,
                onPressed: () => Navigator.pop(context),
                child: Text('OK',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  primary: kbuttonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
