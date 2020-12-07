import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

import '../../../main.dart';

class SummaryTab extends StatefulWidget {
  @override
  _SummaryTabState createState() => _SummaryTabState();
}

class _SummaryTabState extends State<SummaryTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        Container(
          height:ScreenUtil().setHeight(100),width:double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width: ScreenUtil().setWidth(411/3),
                      color: Colors.black87,
                      child: Text('Distance',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              ),

              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width: ScreenUtil().setWidth(411/3),
                      color: Colors.blue[900],
                      child: Text('Class',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              ),

              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width: ScreenUtil().setWidth(411/3),
                      color: Colors.black87,
                      child: Text('Time',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),


        //second

        Container(
          height:ScreenUtil().setHeight(100),width:double.infinity,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width: ScreenUtil().setWidth(411/3),
                      color: Colors.blue[900],
                      child: Text('Race Course',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              ),

              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width: ScreenUtil().setWidth(411/3),
                      color: Colors.black87,
                      child: Text('Ground',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width:ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.blue[200].withOpacity(0.3),border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              ),

              Container(
                height:ScreenUtil().setHeight(100),width:ScreenUtil().setWidth(411/3),
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height:ScreenUtil().setHeight(40),width:ScreenUtil().setWidth(411/3),
                      color: Colors.blue[900],
                      child: Text('Overall',textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      )),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('1',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Litecoin',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('2',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      height:ScreenUtil().setHeight(20),width: ScreenUtil().setWidth(411/3),
                      decoration: BoxDecoration(
                        color: Colors.white,border: Border(
                          bottom: BorderSide(
                            color:Colors.grey,width: 0.5
                          )
                        )
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('3',style: TextStyle(
                            color:Colors.blue[900],fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),),
                          Text('Distance',style: TextStyle(
                            color:Colors.grey,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        )
      ],
    );
  }
}