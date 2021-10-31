import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';

class TimerWidget {
  bool _isActive = true;
  bool _restart = false;
  int _timerDuration = 100;
  final String _startText = "Start/Restart";
  final String _pauseText = "Pause";
  final String _resumeText = "Resume";

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

  int SetDuration(int newDuration) {
    return _timerDuration = newDuration; //sets the duration of the timer
  }
}
