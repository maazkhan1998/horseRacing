import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class PredictorTab extends StatefulWidget {
  @override
  _PredictorTabState createState() => _PredictorTabState();
}

class _PredictorTabState extends State<PredictorTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height:60,width:double.infinity,
              color: Color.fromRGBO(230, 209, 166, 1),
            ),
            Positioned(
              top:ScreenUtil().setHeight(10),left:ScreenUtil().setWidth(320),
              child: Image.asset('assets/Artboard 32.png',height:ScreenUtil().setHeight(60),width:ScreenUtil().setWidth(60)))
          ],
        ),
        Stack(
          children: [
            Container(
              height:ScreenUtil().setHeight(60),width:double.infinity,
              color: Color.fromRGBO(214, 189, 132, 1),
            ),
            Positioned(
              top:ScreenUtil().setHeight(10),left:ScreenUtil().setWidth(200),
              child: Image.asset('assets/Artboard 32.png',height:ScreenUtil().setHeight(60),width:ScreenUtil().setWidth(60)))
          ],
        ),
        Stack(
          children: [
            Container(
              height:ScreenUtil().setHeight(60),width:double.infinity,
              color: Color.fromRGBO(230, 209, 166, 1),
            ),
            Positioned(
              top:ScreenUtil().setHeight(10),left:ScreenUtil().setWidth(340),
              child: Image.asset('assets/Artboard 32.png',height:60,width:ScreenUtil().setWidth(60)))
          ],
        ),
        Stack(
          children: [
            Container(
              height:ScreenUtil().setHeight(60),width:double.infinity,
              color: Color.fromRGBO(214, 189, 132, 1),
            ),
            Positioned(
              top:ScreenUtil().setHeight(10),left:ScreenUtil().setWidth(230),
              child: Image.asset('assets/Artboard 32.png',height:ScreenUtil().setHeight(60),width:ScreenUtil().setWidth(60)))
          ],
        )
      ],
    );
  }
}