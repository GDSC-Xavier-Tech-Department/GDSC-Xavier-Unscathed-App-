import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/paymentaccountpage.dart';

class confirmationMember extends StatelessWidget {
  const confirmationMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: confirmationPageBody(),
        ),
        );
  }
}

class confirmationPageBody extends StatelessWidget {
  const confirmationPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: [
            Text("Congratulations! \n You are now a member of this gym and will not pay a monthly of ₱750 while also paying ₱50 per session.",
            textAlign: TextAlign.center,
            
            style: TextStyle(fontSize: 25.0, color: Colors.white)
            ,),
              SizedBox(
              height: 40.0,
            ),
            customButton(
                  onpress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => paymentAccount())),
                  buttonText: "Continue",
                ),
          ],
          ),
          ),
    );
  }
}