import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/screenutil.dart';

class CustomStaticWidget{

  static apppBar(BuildContext context){
    return PreferredSize(
       preferredSize: Size.fromHeight(ScreenUtil().setHeight(60)),
            child: AppBar(
         backgroundColor: Colors.blue[900],
         centerTitle: true,
         leading: Icon(Icons.search,color:Colors.white),
         title: ImageIcon(AssetImage('assets/Artboard 6 copy.png'),size: ScreenUtil().setSp(50),),
         actions: [
           Container(
             height:90,width:100,
                      child: Column(
               children:[
                 CircleAvatar(
                   radius: ScreenUtil().setSp(20),
                   backgroundImage: AssetImage('assets/Artboard 2 copy 2.png'),
                 ),
                 CountdownTimer(
                   endTime: 60*60*60*10000000,
                   widgetBuilder: (context,remainingTime){
                     return Text(
                      '${remainingTime.hours}:${remainingTime.min}:${remainingTime.sec}');
                   },
                 )
               ]
             ),
           )
         ],
       ),
     );
  }

  static formWidget(BuildContext context){
    return Container(
      width:double.infinity,height:ScreenUtil().setHeight(127),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(vertical:ScreenUtil().setHeight(10),horizontal: ScreenUtil().setWidth(10)),
        itemCount: 5,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index)=>SizedBox(width:ScreenUtil().setWidth(20)),
        itemBuilder: (context,index){
          if(index!=4)
          return Container(
            height:ScreenUtil().setHeight(50),width:ScreenUtil().setWidth(150),
            padding: EdgeInsets.symmetric(
              vertical:ScreenUtil().setHeight(5),horizontal:ScreenUtil().setWidth(10)
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),color:Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ADDINGTON',
                style:TextStyle(
                  color:Colors.blue[600],fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight:FontWeight.bold
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Race 1',
                    style:TextStyle(
                      color:Colors.grey,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                    )),
                    Image.asset('assets/Artboard 2 copy 4.png',height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(20))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('1h 44min',
                    style:TextStyle(
                      color:Colors.grey,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                    )),
                    Text('2600 m',
                    style:TextStyle(
                      color:Colors.grey,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                    ))
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(30),width:ScreenUtil().setWidth(75),
                  decoration: BoxDecoration(
                    color:Colors.blue[900],borderRadius: BorderRadius.circular(2.5)
                  ),
                  child:Text('Form',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color:Colors.white,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),
                  )),
                )
              ],
            ),
          );
          if(index==4) return Container(
          width:ScreenUtil().setWidth(150),
            child:Column(
              children: [
                Text('ADDINGTON',
                style:TextStyle(
                  color:Colors.blue[600],fontSize: 16,fontWeight:FontWeight.bold
                )),
                Image.asset('assets/Artboard 6 copy 2.png',height:ScreenUtil().setHeight(65),width:ScreenUtil().setWidth(150)),
                Container(
                  height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(85),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue[900].withOpacity(0.5)
                  ),
                  child: CountdownTimer(
                    endTime: 60*60*60*10000000,
                    widgetBuilder: (context,time){
                      return Center(
                        child:Text(
                      '${time.hours}:${time.min}:${time.sec}',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.blue[900],fontWeight:FontWeight.bold
                      )
                      )
                      );
                    },
                  ),
                )
              ],
            )
          );
        },
      ),
    );
  }
}