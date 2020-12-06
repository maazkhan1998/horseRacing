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
         title: ImageIcon(AssetImage('assets/Artboard 6 copy.png'),size: 50,),
         actions: [
           Container(
             height:90,width:100,
                      child: Column(
               children:[
                 CircleAvatar(
                   radius:20,
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
      width:double.infinity,height:125,
      child: ListView.separated(
        padding: EdgeInsets.all(10),
        itemCount: 5,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context,index)=>SizedBox(width:20),
        itemBuilder: (context,index){
          if(index!=4)
          return Container(
            height:50,width:150,
            padding: EdgeInsets.symmetric(
              vertical:5,horizontal:10
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
                  color:Colors.blue[600],fontSize: 16,fontWeight:FontWeight.bold
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Race 1',
                    style:TextStyle(
                      color:Colors.grey,fontSize:12,fontWeight: FontWeight.bold
                    )),
                    Image.asset('assets/Artboard 2 copy 4.png',height:20,width:20)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('1h 44min',
                    style:TextStyle(
                      color:Colors.grey,fontSize:12,fontWeight: FontWeight.bold
                    )),
                    Text('2600 m',
                    style:TextStyle(
                      color:Colors.grey,fontSize:12,fontWeight: FontWeight.bold
                    ))
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  height:30,width:75,
                  decoration: BoxDecoration(
                    color:Colors.blue[900],borderRadius: BorderRadius.circular(2.5)
                  ),
                  child:Text('Form',
                  textAlign: TextAlign.center,
                  style:TextStyle(
                    color:Colors.white,fontSize:12,
                  )),
                )
              ],
            ),
          );
          if(index==4) return Container(
          width:150,
            child:Column(
              children: [
                Text('ADDINGTON',
                style:TextStyle(
                  color:Colors.blue[600],fontSize: 16,fontWeight:FontWeight.bold
                )),
                Image.asset('assets/Artboard 6 copy 2.png',height:65,width:150),
                Container(
                  height:20,width:85,
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