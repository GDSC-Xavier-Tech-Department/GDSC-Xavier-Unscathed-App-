import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:unscathed/Backend/timer.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Custom Widgets/customwidgets.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  _TimerPageState createState() => _TimerPageState();
}

TimerWidget timer = TimerWidget();
CountDownController _controller = CountDownController();

class _TimerPageState extends State<TimerPage> {
  TimerWidget timer = TimerWidget();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircularCountDownTimer(
                  autoStart: false,
                  isReverse: true,
                  isReverseAnimation: true,
                  initialDuration: 0,
                  duration: timer.TimerDuration,
                  controller: _controller,
                  //using dependency
                  ringColor: Colors.grey,
                  strokeCap: StrokeCap.round,
                  textStyle: klargeWhiteTextStyle,
                  fillColor: kbuttonColor,
                  height: MediaQuery.of(context).size.height /
                      3, //takes the size of the screen and resizes to the screensize divided by 3
                  width: MediaQuery.of(context).size.width,
                  //timer.TimerDuration,
                  textFormat: CountdownTextFormat.MM_SS,
                  strokeWidth: 20,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customButton(
                      buttonText: timer
                          .StartText, //if timer is not active, change the text to pause and change to play if it is active
                      onpress: () {
                        setState(() {
                          _controller.start();
                          timer.SetIsActive();
                        });

                        print(timer.IsActive.toString());
                      },
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: customButton(
                      buttonText: timer.IsActive == false
                          ? timer.PauseText
                          : timer.ResumeText,
                      onpress: () {
                        setState(() {
                          if (timer.IsActive == false) {
                            _controller.pause();
                            timer.SetIsActive();
                          } else {
                            _controller.resume();
                            timer.SetIsActive();
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
