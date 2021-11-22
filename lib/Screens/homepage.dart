import 'package:flutter/material.dart';
import 'package:unscathed/Backend/constants.dart';
import 'package:unscathed/Custom Widgets/customwidgets.dart';
import 'package:unscathed/Screens/timerpage.dart';
import 'timerpage.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TimerPage())),
                child: GestureDetector(
                  child: customDashboardContainer(
                      firstChild: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(
                          strokeWidth: 10,
                          backgroundColor: kbuttonColor,
                        ),
                      ),
                      Text("Timer")
                    ],
                  )),
                )),
          ),
          Flexible(
            child: GestureDetector(
              child: customDashboardContainer(
                firstChild: Text('first widget'),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: GestureDetector(
                child:
                    customDashboardContainer(firstChild: Text('First widget')),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
