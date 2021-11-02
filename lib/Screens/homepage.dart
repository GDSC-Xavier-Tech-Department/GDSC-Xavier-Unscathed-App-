import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';

import 'package:unscathed/Screens/timerpage.dart';
import 'timerpage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
            child: Container(
          color: Colors.red,
        )),
        SizedBox(
          height: 20.0,
        ),
        Flexible(
            child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => TimerPage())),
          child: Container(
            color: Colors.blueGrey,
          ),
        )),
        SizedBox(height: 20),
        Flexible(
          child: Container(
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
