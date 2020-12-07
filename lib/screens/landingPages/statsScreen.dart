import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/screens/statsScreens/top10Screen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              height:ScreenUtil().setHeight(50),width:double.infinity,
              color: Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,color:Colors.white,size:16
                  ),
                  Text(
                    'Statistics',style: TextStyle(
                      color:Colors.white70,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                    ),
                  ),
                  Text('')
                ],
              ),
            ),SizedBox(height:ScreenUtil().setHeight(10)),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount:5,
              separatorBuilder: (context,index)=>SizedBox(height:ScreenUtil().setHeight(5)),
              itemBuilder: (context,index)=>ListTile(
                onTap: ()=>pushNewScreen(
                  context,
                  screen:Top10Screen()
                ),
                tileColor: Colors.white,
                leading: Text('Top 10 Owners',style: TextStyle(
                  color:Colors.black87,fontSize: ScreenUtil().setSp(18,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}