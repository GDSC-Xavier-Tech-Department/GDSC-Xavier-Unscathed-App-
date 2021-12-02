import 'package:flutter/material.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/confirmationNonPage.dart';
import 'package:unscathed/Screens/confirmationpage.dart';

class paymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: paymentPageBody(),
      ),
    );
  }
}

class paymentPageBody extends StatelessWidget {
  const paymentPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
        child: Column(
          children: [
            Text(
              "Choose your \n Payment Plan",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              'Member',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "will pay a total of \n Php 50.00 per session\/ \nPhp 750.00 per month",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
            SizedBox(
              height: 40.0,
            ),
             customButton(
                  onpress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => confirmationMember())),
                  buttonText: "BE A MEMBER",
                ),
             SizedBox(
              height: 40.0,
            ),
             SizedBox(
              height: 20.0,
              child: Divider(color: Colors.teal.shade100),
            ),
            SizedBox(
              height: 40.0,
            ),
             Text(
              'Non-Member',
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.yellowAccent,
                  fontWeight: FontWeight.normal),
            ),
            SizedBox(
              height: 30.0,
            ),
            Text(
              "will pay a total of Php 100.00 per session",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            ),
             SizedBox(
              height: 30.0,
            ),
             customButton(
                  onpress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => confirmationNonMember())),
                  buttonText: "AVAIL NON-MEMBER",
                ),
          ],
        ),
      ),
    );
  }
}