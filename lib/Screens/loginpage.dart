import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Screens/dashboard.dart';
import 'package:unscathed/Screens/welcomepage.dart';
import 'package:unscathed/Custom Widgets/customwidgets.dart';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

bool _passwordLogin = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(fontSize: 20, color: kbuttonColor),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Flexible(
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              hintText: "name@example.com",
                              labelText: "Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Flexible(
                        child: Container(
                          child: TextFormField(
                            obscureText: _passwordLogin,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _passwordLogin = !_passwordLogin;
                                    });
                                  },
                                  icon: _passwordLogin
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off)),
                              prefixIcon: Icon(Icons.lock_open),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      customButton(
                          //TODO: Add Integration with Firebase
                          buttonText: "Submit",
                          onpress: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Submitting Data'),
                              ),
                            );

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      InkWell(
                        onTap: () => launch("www.facebook.com"),
                        //TODO: Add URL or Page for forgot password
                        child: Text(
                          "Forgot Password?",
                          style: khighlightedTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      customDivider(),
                      SizedBox(height: 15.0),
                      Text("or Login with"),
                      //TODO: Add custom Textstyle to text
                      //TODO: Add button functionality to be paired with Firebase for buttons
                      SizedBox(height: 15.0),
                      SignInButton(Buttons.GoogleDark, onPressed: () {}),
                      SignInButton(Buttons.Facebook, onPressed: () {}),
                      SignInButton(Buttons.AppleDark, onPressed: () {})
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/bg2.png'), fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
