import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Screens/homepage.dart';
import 'package:unscathed/Screens/loginpage.dart';
import 'package:unscathed/Screens/registerpage.dart';
import 'package:unscathed/Custom Widgets/customwidgets.dart';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

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
      child: Container(
        color: kdarkColor,
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
                      MaterialPageRoute(builder: (context) => LoginPage())),
                  buttonText: "Login",
                ),
                SizedBox(height: 10.0),
                customButton(
                    onpress: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterPage())),
                    buttonText: "Register"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
