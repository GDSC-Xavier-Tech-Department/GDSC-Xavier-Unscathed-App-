import 'package:flutter/material.dart';
import 'package:unscathed_app/Backend/constants.dart';

class welcomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UNSCATHED GYM"),
      ),
      body: welcomePageBody(),
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
                    buttonText: "Login",
                  ),
                  customButton(buttonText: "Register"),
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

  customButton({required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(buttonColor),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        fixedSize: MaterialStateProperty.all(
          Size.fromWidth(150), //sets buttons with a fixed size
        ),
      ),
      onPressed: () => print('jems'),
      child: Text(buttonText),
    );
  }
}
