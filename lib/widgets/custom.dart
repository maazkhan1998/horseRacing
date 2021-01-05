import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mks_racing/screens/landingPage.dart';
import 'package:mks_racing/screens/racingScreen/raceScreen.dart';
import 'package:mks_racing/screens/userDetailScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../main.dart';

class CustomStaticWidget {
  static formWidget(BuildContext context) {
    return Container(
      width: devWidth,
      height: ScreenUtil().setHeight(127),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: ScreenUtil().setHeight(127),
            width: ScreenUtil().setWidth(300),
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                  vertical: ScreenUtil().setHeight(10),
                  horizontal: ScreenUtil().setWidth(10)),
              itemCount: 4,
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>
                  SizedBox(width: ScreenUtil().setWidth(10)),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => RaceScreen())),
                    child: Container(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(150),
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(5),
                          horizontal: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('ADDINGTON',
                              style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: ScreenUtil()
                                      .setSp(16, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Race 1',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(12,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.bold)),
                              Image.asset('assets/Artboard 2 copy 4.png',
                                  height: ScreenUtil().setHeight(20),
                                  width: ScreenUtil().setWidth(20))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('1h 44min',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(12,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.bold)),
                              Text('2600 m',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: ScreenUtil().setSp(12,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(75),
                            decoration: BoxDecoration(
                                color: Colors.blue[900],
                                borderRadius: BorderRadius.circular(2.5)),
                            child: Text('Form',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenUtil()
                                      .setSp(12, allowFontScalingSelf: true),
                                )),
                          )
                        ],
                      ),
                    ));
              },
            ),
          ),
          Container(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
              width: ScreenUtil().setWidth(100),
              child: Column(
                children: [
                  Text('ADDINGTON',
                      style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: ScreenUtil().setSp(16),
                          fontWeight: FontWeight.bold)),
                  Image.asset('assets/Artboard 6 copy 2.png',
                      height: ScreenUtil().setHeight(65),
                      width: ScreenUtil().setWidth(150)),
                  Container(
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(85),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[900].withOpacity(0.5)),
                    child: CountdownTimer(
                      endTime: endTime,
                      onEnd: () {},
                      widgetBuilder: (context, time) {
                        if (time == null)
                          return Center(
                              child: Text('Race Started',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: ScreenUtil().setSp(12),
                                      fontWeight: FontWeight.bold)));
                        return Center(
                            child: Text('${time.min}:${time.sec}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold)));
                      },
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}

class AppBarClock extends StatefulWidget {
  @override
  _AppBarClockState createState() => _AppBarClockState();
}

class _AppBarClockState extends State<AppBarClock> {
  String _timeString;
  Timer timer;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue[900],
      centerTitle: true,
      leading: Icon(Icons.search, color: Colors.white),
      title: ImageIcon(
        AssetImage('assets/Artboard 6 copy.png'),
        size: ScreenUtil().setSp(50),
      ),
      actions: [
        Container(
          height: 91,
          width: 100,
          child: Column(children: [
            GestureDetector(
                onTap: () => pushNewScreen(context,
                    withNavBar: false, screen: UserDetailScreen()),
                child: CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundImage: AssetImage('assets/Artboard 2 copy 2.png'),
                )),
            Text(_timeString)
          ]),
        )
      ],
    );
  }
}
