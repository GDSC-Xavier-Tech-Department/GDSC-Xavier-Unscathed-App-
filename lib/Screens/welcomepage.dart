import 'package:flutter/material.dart';
import 'package:unscathed_app/Backend/constants.dart';
import 'package:unscathed_app/Screens/homepage.dart';
import 'package:unscathed_app/Screens/registerpage.dart';

import 'package:date_time_picker/date_time_picker.dart';

class welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("UNSCATHED GYM"),
        // ),
        body: welcomePageBody(),
      ),
    );
  }
}

class welcomePageBody extends StatelessWidget {
  const welcomePageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/welcomepage_background.png'),
              fit: BoxFit.cover),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/unscathed_logo.png',
                width: 300,
              ),
              Column(
                children: [
                  customButton(
                    onpress: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homepage())),
                    buttonText: "Login",
                  ),
                  SizedBox(height: 10.0),
                  customButton(
                      onpress: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage())),
                      buttonText: "Register"),
                  //TODO: Create Register Button and change Navigator.pushh
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
