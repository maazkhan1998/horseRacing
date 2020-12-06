import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/screens/landingPage.dart';

class AlertScreen extends StatefulWidget {
  @override
  _AlertScreenState createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  alertBox() {
    return showDialog(
      context: context,
      child: SimpleDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        contentPadding: EdgeInsets.all(0),
        children: [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(60)),
          child: AppBar(
            backgroundColor: Colors.blue[900],
            centerTitle: true,
            title: Text(
              'Login',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(22,allowFontScalingSelf: true),
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/Artboard 2 copy 2.png'),
              )
            ],
          ),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: ScreenUtil().setHeight(20)),
            height: ScreenUtil().setHeight(245),
            width: ScreenUtil().setWidth(340),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/Artboard 6.png', height: ScreenUtil().setHeight(80), width: ScreenUtil().setWidth(80)),
                SizedBox(height: ScreenUtil().setHeight(10)),
                Text(
                  "LET'S GET STARTED",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: ScreenUtil().setSp(22,allowFontScalingSelf: true),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "We've sent a confirmation to your e-mail for verification",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[350], fontWeight: FontWeight.bold),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),
                GestureDetector(
                  onTap: ()=>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=>LandingPage()
                    )
                  ),
                                  child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(40),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Go To Home Page',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                            fontWeight: FontWeight.w500),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
