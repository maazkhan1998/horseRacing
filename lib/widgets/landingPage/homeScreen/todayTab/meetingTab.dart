import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/apiURL.dart';
import 'package:mks_racing/main.dart';
import 'package:mks_racing/model/meetingByDate.dart';
import 'package:mks_racing/screens/landingPages/RacingScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:http/http.dart' as http;

import 'indicator.dart';

class MeetingTab extends StatefulWidget {
  @override
  _MeetingTabState createState() => _MeetingTabState();
}

class _MeetingTabState extends State<MeetingTab> {
  bool isFirstTileOpened = false;
  bool isSecondTileOpened = false;
  int touchedIndex;

  bool isLoading = true;
  MeetingByDate meetings;

  initState() {
    Future.delayed(Duration(seconds: 0), () async {
      try {
        final response =
            await http.get(todayMeetingURL, headers: {'ismobile': 'true'});
        final data = json.decode(response.body) as Map<String, dynamic>;
        if (response.statusCode == 200) {
          meetings = MeetingByDate.fromJson(data);
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
        }
      } catch (e) {
        setState(() => isLoading = false);
      }
    });
    super.initState();
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemCount: meetings.data.length,
                separatorBuilder: (context, index) =>
                    SizedBox(height: ScreenUtil().setHeight(5)),
                itemBuilder: (context, index) {
                  bool isTileOpen = false;
                  return StatefulBuilder(
                    builder: (context, state) => Container(
                        color: Colors.white,
                        child: ExpansionTile(
                          initiallyExpanded: isTileOpen,
                          onExpansionChanged: (val) =>
                              state(() => isTileOpen = val),
                          leading: CircleAvatar(
                              child: Flag(meetings.data[index].flag)),
                          title: Text(
                            meetings.data[index].countryName,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil()
                                    .setSp(18, allowFontScalingSelf: true),
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(30),
                            color: Colors.blue[900],
                            child: Center(
                              child: Icon(
                                  !isTileOpen ? Icons.add : Icons.remove,
                                  color: Colors.grey,
                                  size: 30),
                            ),
                          ),
                          backgroundColor: Colors.white,
                          children: List.generate(
                              meetings.data[0].meetingCodes.length,
                              (i) => GestureDetector(
                                    onTap: () => pushNewScreen(context,
                                        screen: RacingScreen(
                                          meetingCode: meetings.data[index]
                                              .meetingCodes[i].meetingCode,
                                        )),
                                    child: Container(
                                      width: devWidth,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      alignment: Alignment.center,
                                      height: ScreenUtil().setHeight(50),
                                      decoration: BoxDecoration(
                                          color:
                                              Colors.grey[300].withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              meetings
                                                  .data[index]
                                                  .meetingCodes[i]
                                                  .racecourseFullName,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: ScreenUtil().setSp(
                                                      16,
                                                      allowFontScalingSelf:
                                                          true))),
                                          Text(
                                              meetings.data[index]
                                                  .meetingCodes[i].raceTime,
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: ScreenUtil().setSp(
                                                      16,
                                                      allowFontScalingSelf:
                                                          true)))
                                        ],
                                      ),
                                    ),
                                  )),
                        )),
                  );
                }),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(5), horizontal: 10),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(15)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(25)),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(150),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/Artboard 14.png'))),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: ScreenUtil().setHeight(20),
                    ),
                    child: Text(
                        'Davis Fellas : Race Review of Happy Valley - 8th Novemeber 2020',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: ScreenUtil()
                                .setSp(16, allowFontScalingSelf: true),
                            fontWeight: FontWeight.bold)),
                  )
                ]),
              )
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
          color: Colors.blue[900],
          child: Text(
            'Competition',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
            color: Colors.white,
            child: ExpansionTile(
              initiallyExpanded: isFirstTileOpened,
              onExpansionChanged: (val) =>
                  setState(() => isFirstTileOpened = val),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Artboard 12.png'),
              ),
              title: Text(
                'United Kingdom',
                style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        ScreenUtil().setSp(18, allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                height: ScreenUtil().setHeight(30),
                width: ScreenUtil().setWidth(30),
                color: Colors.blue[900],
                child: Center(
                  child: Icon(!isFirstTileOpened ? Icons.add : Icons.remove,
                      color: Colors.grey, size: 30),
                ),
              ),
              backgroundColor: Colors.white,
              children: [tileExpansion(context)],
            )),
        SizedBox(height: ScreenUtil().setHeight(10)),
        Container(
            color: Colors.white,
            child: ExpansionTile(
              initiallyExpanded: isSecondTileOpened,
              backgroundColor: Colors.white,
              children: [tileExpansion(context)],
              onExpansionChanged: (val) =>
                  setState(() => isSecondTileOpened = val),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Artboard 12 copy.png'),
              ),
              title: Text(
                'England',
                style: TextStyle(
                    color: Colors.black,
                    fontSize:
                        ScreenUtil().setSp(18, allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                height: ScreenUtil().setHeight(30),
                width: ScreenUtil().setWidth(30),
                color: Colors.blue[900],
                child: Center(
                  child: Icon(isSecondTileOpened ? Icons.remove : Icons.add,
                      color: Colors.grey, size: 30),
                ),
              ),
            )),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Container(
          width: double.infinity,
          height: ScreenUtil().setHeight(45),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(40)),
          color: Colors.blue[900],
          child: Text(
            'Live Prediction',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          title: Text(
            "NewCastle | Race 1",
            style: TextStyle(color: Colors.blue[800], fontSize: 16),
          ),
          trailing: Text(
            '2m',
            style: TextStyle(fontSize: 16, color: Colors.blue[800]),
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(411),
          height: ScreenUtil().setHeight(250),
          color: Colors.white,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: ScreenUtil().setWidth(411),
              child: Row(children: [
                SizedBox(height: ScreenUtil().setHeight(10)),
                PieChart(
                  PieChartData(
                      pieTouchData:
                          PieTouchData(touchCallback: (pieTouchResponse) {
                        setState(() {
                          if (pieTouchResponse.touchInput is FlLongPressEnd ||
                              pieTouchResponse.touchInput is FlPanEnd) {
                            touchedIndex = -1;
                          } else {
                            touchedIndex = pieTouchResponse.touchedSectionIndex;
                          }
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Indicator(
                      color: Color(0xff0293ee),
                      text: 'First',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(4),
                    ),
                    Indicator(
                      color: Color(0xfff8b250),
                      text: 'Second',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(4),
                    ),
                    Indicator(
                      color: Color(0xff845bef),
                      text: 'Third',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(4),
                    ),
                    Indicator(
                      color: Color(0xff13d38e),
                      text: 'Fourth',
                      isSquare: true,
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(18),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ],
    );
  }
}

tileExpansion(BuildContext context) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => pushNewScreen(context, screen: RacingScreen()),
        child: Container(
          width: devWidth,
          padding: EdgeInsets.symmetric(horizontal: 15),
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          alignment: Alignment.center,
          height: ScreenUtil().setHeight(50),
          decoration: BoxDecoration(
              color: Colors.grey[300].withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Newcastle',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          ScreenUtil().setSp(16, allowFontScalingSelf: true))),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setHeight(30),
                      alignment: Alignment.center,
                      child: Text(
                        'F',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil()
                                .setSp(16, allowFontScalingSelf: true)),
                      )),
                  Container(
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setHeight(30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(
                        width: ScreenUtil().setWidth(2),
                        color: Colors.grey,
                      )),
                      child: Text(
                        'H',
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenUtil()
                                .setSp(16, allowFontScalingSelf: true)),
                      )),
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Text('2 m',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true)))
                ],
              )
            ],
          ),
        ),
      ),
      Container(
        width: devWidth,
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        alignment: Alignment.center,
        height: ScreenUtil().setHeight(50),
        decoration: BoxDecoration(
            color: Colors.grey[300].withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Wolverhampton',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        ScreenUtil().setSp(16, allowFontScalingSelf: true))),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setHeight(30),
                    alignment: Alignment.center,
                    child: Text(
                      'F',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true)),
                    )),
                Container(
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setHeight(30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                      width: ScreenUtil().setWidth(2),
                      color: Colors.grey,
                    )),
                    child: Text(
                      'H',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true)),
                    )),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Text('17 m',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true)))
              ],
            )
          ],
        ),
      )
    ],
  );
}
