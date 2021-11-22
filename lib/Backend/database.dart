import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Database {
  //variables
  String _aboutMe = "Lorem Ipsulem";
  String _name = "James";
  String _email = "Example@example.com";
  String _password = "Pathfinder21!";
  int _phoneNumber = 09358142318;
  int _height = 163;
  String _longestStreak = "2 Months";
  String _birthday = DateTime(2021, 11, 20).toString();
  DateTime _memberSince = DateTime(2021, 1, 1);
  DateTime _expiration = DateTime(2021, 11, 12);

//Date Formatter
  final DateFormat formatter = DateFormat('yyyy-MM-dd');

//getters
  String get Name {
    return _name;
  }

  String get Email {
    return _email;
  }

  String get Password {
    return _password;
  }

  int get PhoneNumber {
    return _phoneNumber;
  }

  int get Height {
    return _height;
  }

  String get LongestStreak {
    return _longestStreak;
  }

  String get Bio {
    return _aboutMe;
  }

//FIXME: Fix data types for dates, should be inputted as DateTime, converted to String when stored, and reconverted to DateTime when accessed
  // String get Birthday {
  //   return formatter.format(_birthday);
  // }

  DateTime get MemberSince {
    return _memberSince;
  }

  DateTime get Expiration {
    return _expiration;
  }

  //setters

  set AboutMe(String about) {
    this._aboutMe = about;
  }

  set Name(String name) {
    this._name = name;
  }

  set Email(String email) {
    this._email = email;
  }

  set Number(int number) {
    this._phoneNumber = number;
  }

  set Height(int height) {
    this._height = height;
  }

  // set Birthday(DateTime birthday) {
  //   this._birthday = birthday.toString();
  // }

  set Password(String password) {
    this._password = password;
  }
}
