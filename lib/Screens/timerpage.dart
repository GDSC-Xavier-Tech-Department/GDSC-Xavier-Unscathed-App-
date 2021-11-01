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
TextEditingController minController = TextEditingController();
TextEditingController secController = TextEditingController();
int? _duration;

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
            customTimerSetDurationWidget(
              //using controller as parameter so I can access it from timerpage file
              minuteController: //controller for minutes so I can access the value of the textform widget from customwidgets file
                  minController,
              secondsController:
                  secController, //controller for seconds so I can access the value of the textform widget from customwidgets file
            ),
            SizedBox(height: 10),
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
                          if (secController.text
                                  .isNotEmpty || //will only start the counter if there is value in the textform
                              minController.text.isNotEmpty) {
                            // _duration = timer.setDuration(
                            //   minutes: int.parse(minController.text),
                            //   seconds: int.parse(secController.text),
                            // );
                            if (minController.text.isEmpty) { //if the value of the minutes textform is empty, use default value of 0 instead
                              _duration = timer.setDuration(
                                minutes: 0,
                                seconds: int.parse(secController.text),
                              );
                            }
                            if (secController.text.isEmpty) { //if the value of the seconds textform is empty, use default value of 0 instead
                              _duration = timer.setDuration(
                                  minutes: int.parse(minController.text),
                                  seconds: 0);
                            } //FIXME: Timer does not automatically change its duration when you change it in the textform
                            //you need to exit the screen and press start for it to work
                            print("timerpage duration is: $_duration");
                            _controller.start();
                            print("Controller value is: ");
                            print(timer.TimerDuration); //starts the timer
                            // timer
                            //     .SetIsActive(); //will call the SetIsActive method that will change the value of isActive to its opposite boolean (True -> False and vice versa)
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Please enter duration for timer"), //will throw error if the user does not input a value for the duration
                              ),
                            );
                          }
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
                          ? timer
                              .PauseText //will change the button text to pause when timer is not active
                          : timer
                              .ResumeText, //will change the button text to resume when timer is not active
                      onpress: () {
                        setState(() {
                          if (timer.IsActive == false) {
                            _controller.pause();
                            timer
                                .SetIsActive(); //if timer is not active, button press will pause the timer
                          } else {
                            _controller
                                .resume(); //if timer is active, button press will resume the timer
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
