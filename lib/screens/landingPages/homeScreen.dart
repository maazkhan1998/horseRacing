import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/main.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:mks_racing/widgets/landingPage/homeScreen/todayTab.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  int index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
          body: SingleChildScrollView(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),
            SizedBox(height:ScreenUtil().setHeight(10)),
            Container(
              width: double.infinity,height:ScreenUtil().setHeight(50),
              color: Colors.white,
              child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: ()=>setState(()=>index=0),
                                      child: Container(
                                        alignment: Alignment.center,
                        height:ScreenUtil().setHeight(50),width: ScreenUtil().setWidth(411/3),
                        child: Text('Today',
                      textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontWeight:FontWeight.bold
                        ),),
                        color: index==0?Colors.blue[900]:Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>setState(()=>index=1),
                                      child: Container(
                                        alignment: Alignment.center,
                        height:ScreenUtil().setHeight(50),width: ScreenUtil().setWidth(411/3),
                        child: Text('Big Races',
                      textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontWeight:FontWeight.bold
                        ),),
                        color: index==1?Colors.blue[900]:Colors.white,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()=>setState(()=>index=2),
                                      child: Container(
                                        alignment: Alignment.center,
                        height:ScreenUtil().setHeight(50),width: ScreenUtil().setWidth(411/3),
                        child: Text('Calendar',
                      textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.black,fontWeight:FontWeight.bold
                        ),),
                        color: index==2?Colors.blue[900]:Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height:ScreenUtil().setHeight(10)),
              if(index==0)TodayTab()
          ],
        ),
      ),
    );
  }
}