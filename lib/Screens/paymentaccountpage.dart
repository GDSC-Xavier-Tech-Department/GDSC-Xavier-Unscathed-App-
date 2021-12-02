import 'package:flutter/material.dart';
import 'package:unscathed/Custom%20Widgets/customwidgets.dart';
import 'package:unscathed/Screens/homepage.dart';

class paymentAccount extends StatefulWidget {
  paymentAccount({Key? key}) : super(key: key);

  @override
  _paymentAccountState createState() => _paymentAccountState();
}

class _paymentAccountState extends State<paymentAccount> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(  
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
            Text("Your next billing date is \nTBA ", 
            textAlign: TextAlign.center, style: TextStyle(fontSize: 30.0, color: Colors.white),),
            SizedBox(
              height: 70.0,
            ),
            Container(child: FlatButton(  
                  child: Text('Manage Payment Info          >', style: TextStyle(fontSize: 20.0),),  
                  color: Colors.transparent,  
                  textColor: Colors.yellow,  
                  onPressed: () {},  
                ),
                  ),
                   SizedBox(
              height: 20.0,
            ),
            Container(child: FlatButton(  
                  child: Text('Billing Details                         >', style: TextStyle(fontSize: 20.0),),  
                  color: Colors.transparent,  
                  textColor: Colors.yellow,  
                  onPressed: () {},  
                ),
            ),
             SizedBox(
              height: 20.0,
            ),
            Container(child: FlatButton(  
                  child: Text('Change Plan                           >', style: TextStyle(fontSize: 20.0),),  
                  color: Colors.transparent,  
                  textColor: Colors.yellow,  
                  onPressed: () {},  
                ),
            ),
            SizedBox(
              height: 60.0,
            ),
            customButton(
                  onpress: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => homepage())),
                  buttonText: "Cancel Membership",
                ),
          ],
        ),
      ),
    ));
  }
}
