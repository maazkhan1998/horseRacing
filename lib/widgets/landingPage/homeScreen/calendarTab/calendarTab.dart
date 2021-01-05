import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTab extends StatefulWidget {
  @override
  _CalendarTabState createState() => _CalendarTabState();
}

class _CalendarTabState extends State<CalendarTab> {
  CalendarController calendarController;

  List<dynamic> temp = ['adasasdsa'];

  @override
  void initState() {
    super.initState();
    calendarController = CalendarController();
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
          events: {
            DateTime.now().subtract(Duration(days: 1)): temp,
            DateTime.now().subtract(Duration(days: 2)): temp,
            DateTime.now().subtract(Duration(days: 3)): temp
          },
        )
      ],
    );
  }
}
