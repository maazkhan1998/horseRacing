import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/screens/racingScreen/raceScreen.dart';
import 'package:mks_racing/screens/racingScreen/remainingRaceScreen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../../model/raceCardByMeetingCode.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../apiURL.dart';
import 'dart:convert';
import 'package:flag/flag.dart';

class RacingScreen extends StatefulWidget {
  final String meetingCode;

  RacingScreen({this.meetingCode});
  @override
  _RacingScreenState createState() => _RacingScreenState();
}

class _RacingScreenState extends State<RacingScreen> {
  RaceCardByMeetingCode races;
  bool isLoading = true;

  initState() {
    Future.delayed(Duration(seconds: 0), () async {
      try {
        final response = await http.get(
            raceCardByMeetingCodeURL + widget.meetingCode,
            headers: {'ismobile': 'true'});
        final data = json.decode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          races = RaceCardByMeetingCode.fromJson(data);
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
          return Fluttertoast.showToast(msg: data['message']);
        }
      } catch (e) {
        setState(() => isLoading = false);
        return Fluttertoast.showToast(msg: e.toString());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarClock(),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RaceCardTodayWidget(
                    Provider.of<RaceCardTodayProvider>(context, listen: false)
                        .raceCardToday),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Container(
                  color: Colors.blue[900],
                  height: ScreenUtil().setHeight(50),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Flag(races.data[0].countryFlag),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(20),
                      ),
                      Text(
                        races.data[0].racecourse,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(16, allowFontScalingSelf: true),
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                ListView.separated(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: races.data.length,
                  separatorBuilder: (context, index) =>
                      SizedBox(height: ScreenUtil().setHeight(10)),
                  itemBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(100),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => pushNewScreen(context,
                              screen: RaceScreen(races.data[index].id)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(10),
                                horizontal: ScreenUtil().setWidth(10)),
                            height: ScreenUtil().setHeight(100),
                            width: ScreenUtil().setWidth(411 / 4 * 2.75),
                            color: Colors.white,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Container(
                                        height: ScreenUtil().setHeight(90),
                                        width: ScreenUtil().setWidth(55),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height:
                                                    ScreenUtil().setHeight(50),
                                                width:
                                                    ScreenUtil().setWidth(50),
                                                decoration: BoxDecoration(
                                                    color: Colors.red[800],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(5),
                                                            topRight:
                                                                Radius.circular(
                                                                    5))),
                                                child: Text(
                                                  races.data[index].raceNo
                                                      .toString(),
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: ScreenUtil().setSp(
                                                          18,
                                                          allowFontScalingSelf:
                                                              true),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              Container(
                                                alignment: Alignment.center,
                                                height:
                                                    ScreenUtil().setHeight(20),
                                                width:
                                                    ScreenUtil().setWidth(50),
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[800],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(5),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    5))),
                                                child: Text(
                                                  races.data[index].raceTime,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 3,
                                        right: 0,
                                        child: Container(
                                          height: ScreenUtil().setHeight(20),
                                          width: ScreenUtil().setWidth(20),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2.5),
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey,
                                                  width: 1)),
                                          child: Text('F',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: ScreenUtil().setSp(
                                                      16,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      )
                                    ]),
                                SizedBox(width: ScreenUtil().setWidth(10)),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(children: [
                                          TextSpan(
                                              text: races.data[index].raceName,
                                              style: TextStyle(
                                                  color: Colors.blue[900],
                                                  fontSize: ScreenUtil().setSp(
                                                      12,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                              text:
                                                  '- ${races.data[index].raceKind}',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: ScreenUtil().setSp(
                                                      12,
                                                      allowFontScalingSelf:
                                                          true),
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                      ),
                                      Text(
                                        races.data[index].kindOfHorse,
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: ScreenUtil().setSp(12,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                          'Distance: ${races.data[index].distance} | Flat Race |',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(10,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          'Purse: ${races.data[index].purse} | ${races.data[index].noOfHorseInRace}',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(10,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(100),
                          width: ScreenUtil().setWidth(411 / 4 * 1.25),
                          color: Colors.blue[900].withOpacity(0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(10),
                                    top: ScreenUtil().setHeight(12)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: '1. ',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.w900)),
                                        TextSpan(
                                            text: races.data[index].positions[0]
                                                .horseName,
                                            style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(12,
                                                    allowFontScalingSelf:
                                                        true)))
                                      ]),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: '2. ',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.w900)),
                                        TextSpan(
                                            text: races.data[index].positions[1]
                                                .horseName,
                                            style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(12,
                                                    allowFontScalingSelf:
                                                        true)))
                                      ]),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: '3. ',
                                            style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf: true),
                                                fontWeight: FontWeight.w900)),
                                        TextSpan(
                                            text: races.data[index].positions[2]
                                                .horseName,
                                            style: TextStyle(
                                                color: Colors.grey[900],
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(12,
                                                    allowFontScalingSelf:
                                                        true)))
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                              Spacer(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: ScreenUtil().setHeight(20),
                                    width: ScreenUtil()
                                        .setWidth(411 / 4 * 1.25 / 2),
                                    color: Colors.blue[900].withOpacity(0.4),
                                    child: FlatButton.icon(
                                        padding: EdgeInsets.all(0),
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_forward,
                                            size: 12, color: Colors.blue[900]),
                                        label: Text(races.data[index].raceTime,
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(12,
                                                    allowFontScalingSelf: true),
                                                color: Colors.blue[900]))),
                                  ),
                                  GestureDetector(
                                    onTap: () => pushNewScreen(context,
                                        screen: RemainingRaceScreen()),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: ScreenUtil().setHeight(20),
                                      width: ScreenUtil()
                                          .setWidth(411 / 4 * 1.25 / 2),
                                      color: Colors.blue[900],
                                      child: Text(
                                        'Result',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ScreenUtil().setSp(12,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
    );
  }
}
