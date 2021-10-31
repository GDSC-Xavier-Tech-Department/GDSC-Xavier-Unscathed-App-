import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:unscathed/Backend/timer.dart';
import 'package:unscathed/Screens/timerpage.dart';
import 'timerpage.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

TimerWidget timer = TimerWidget(); //timer object

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
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: CircularCountDownTimer(
                //using dependency
                ringColor: Colors.black,
                strokeCap: StrokeCap.round,
                textStyle: klargeTextStyle,
                fillColor: kbuttonColor,
                height: MediaQuery.of(context).size.height /
                    3, //takes the size of the screen and resizes to the screensize divided by 3
                width: MediaQuery.of(context).size.width,
                duration: timer.TimerDuration,
                autoStart: false,
                strokeWidth: 15,
              ),
            ),
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
