import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarClock(),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaceCardTodayWidget(
              Provider.of<RaceCardTodayProvider>(context, listen: false)
                  .raceCardToday),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              'My Selection',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              'My Stanting',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              'Change Password',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              '- -',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              'Shop',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5)),
          ListTile(
            tileColor: Colors.white,
            leading: Text(
              'Edit Information',
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: ScreenUtil().setSp(18, allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: ScreenUtil().setHeight(5))
        ],
      )),
    );
  }
}
