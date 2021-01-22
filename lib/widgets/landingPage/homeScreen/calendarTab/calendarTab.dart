import 'dart:convert';

import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mks_racing/apiURL.dart';
import 'package:mks_racing/model/meetingByDate.dart';
import 'package:mks_racing/screens/landingPages/RacingScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;

import '../../../../main.dart';

class CalendarTab extends StatefulWidget {
  @override
  _CalendarTabState createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  CalendarController calendarController;

  List<dynamic> temp = ['adasasdsa'];

  bool isLoading = true;
  MeetingByDate meetings = MeetingByDate(data: [], message: '', success: false);

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
    Future.delayed(Duration(seconds: 0), () async {
      try {
        final response =
            await http.get(todayMeetingURL, headers: {'ismobile': 'true'});
        if (response.statusCode == 200) {
          final data = json.decode(response.body) as Map<String, dynamic>;
          meetings = MeetingByDate.fromJson(data);
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
        }
      } catch (e) {
        setState(() => isLoading = false);
        return Fluttertoast.showToast(msg: e.toString());
      }
    });
  }

  @override
  void dispose() {
    calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TableCalendar(
          calendarController: calendarController,
          calendarStyle: CalendarStyle(
            markersPositionBottom: 5,
            markersColor: Colors.black,
          ),
          initialSelectedDay: DateTime.now(),
          events: {},
          onDaySelected: (DateTime day, List events, List holidays) async {
            try {
              setState(() => isLoading = true);
              final response = await http
                  .get(dateByMeeting(day), headers: {'ismobile': 'true'});
              final data = json.decode(response.body) as Map<String, dynamic>;
              if (response.statusCode == 200) {
                meetings = MeetingByDate.fromJson(data);
                setState(() => isLoading = false);
              } else {
                setState(() => isLoading = false);
              }
            } catch (e) {
              setState(() => isLoading = false);
              return Fluttertoast.showToast(msg: e.toString());
            }
          },
        ),
        isLoading
            ? CircularProgressIndicator()
            : ListView.separated(
                itemCount: meetings.data.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                separatorBuilder: (context, index) =>
                    SizedBox(height: ScreenUtil().setHeight(10)),
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
                },
              )
      ],
    );
  }
}
