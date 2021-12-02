import 'package:flutter/material.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/homepage.dart';

class confirmationNonMember extends StatelessWidget {
  const confirmationNonMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: confirmationNonMemberBody(),
      ),
    );
  }
}

class confirmationNonMemberBody extends StatelessWidget {
  const confirmationNonMemberBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,          
          children: [
            Text("Congratulations! \nYou are now a non-member of this gym and will pay ₱100 per session.",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 25.0, color: Colors.white)
            ,),
              SizedBox(
              height: 40.0,
            ),
            customButton(
                  onpress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage())),
                  buttonText: "Continue",
                ),
          ],
          ),
          ),
    );
  }
}