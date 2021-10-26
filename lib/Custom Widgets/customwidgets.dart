import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';

class customDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1.5,
      color: kbuttonColor,
      height: 15.0,
      indent: 30.0,
      endIndent: 30.0,
    );
  }
}
