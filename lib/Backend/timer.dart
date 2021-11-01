import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

//will act as the brain for the entire timer widget
class TimerWidget {
  bool _isActive = true;
  bool _restart = false;
  static int _timerDuration = 0;

  final String _startText = "Start/Restart";
  final String _pauseText = "Pause";
  final String _resumeText = "Resume";

  int setDuration({required int minutes, required int seconds}) {
    double minuteConversion = minutes * 60; //convert minutes to seconds
    // print("minute conversion is: $minuteConversion");
    int totalDuration = minuteConversion.floorToDouble().toInt() +
        seconds; //add minutes converted to seconds to get total duration in seconds
    // print("Minute conversion is: $minuteConversion");
    // print("Seconds duration is: $seconds");
    // print("total duration is: ");
    print(totalDuration);
    return _timerDuration = totalDuration;
  }

  get IsActive {
    return _isActive;
  }

  get Restart {
    return _restart;
  }

  get TimerDuration {
    return _timerDuration;
  }

  get StartText {
    return _startText;
  }

  get PauseText {
    return _pauseText;
  }

  get ResumeText {
    return _resumeText;
  }

  bool SetIsActive() {
    return _isActive =
        !_isActive; //will set the timer as active or inactive for pausing and playing
  }

  bool FalseIsActive() {
    return _isActive = false;
  }

  // bool SetRestart() {
  //   return _restart = !_restart; //will set the
  // }

}
