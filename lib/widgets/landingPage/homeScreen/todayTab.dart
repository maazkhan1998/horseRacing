import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/widgets/landingPage/homeScreen/todayTab/meetingTab.dart';

class TodayTab extends StatefulWidget {
  @override
  _TodayTabState createState() => _TodayTabState();
}

class _TodayTabState extends State<TodayTab> with SingleTickerProviderStateMixin{

  initState(){
    controller=TabController(length: 2,vsync:this);
    super.initState();
  }

  TabController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: ScreenUtil().setHeight(50),width:double.infinity,
          color: Colors.white,
          child:TabBar(
            onTap: (index)=>setState(()=>controller.index=index),
            controller: controller,
            labelColor: Colors.blue[900],
            indicatorColor: Colors.blue[900],
            indicatorWeight: 6,
            unselectedLabelColor: Colors.grey,
            labelStyle:TextStyle(
             fontWeight: FontWeight.bold,fontSize:ScreenUtil().setSp(20,allowFontScalingSelf: true)
            ) ,
            unselectedLabelStyle: TextStyle(
             fontWeight: FontWeight.bold,fontSize:ScreenUtil().setSp(20,allowFontScalingSelf: true)
            ),
            tabs: [
              Tab(text:'BY MEETING'),
              Tab(text:'BY TIME')
            ],
          )
        ),SizedBox(height:ScreenUtil().setHeight(10)),
        if(controller.index==0)MeetingTab()
      ],
    );
  }
}