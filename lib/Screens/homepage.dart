import 'package:flutter/material.dart';
import 'package:unscathed_app/Backend/constants.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UNSCATHED GYM'),
      ),
    );
  }
}
