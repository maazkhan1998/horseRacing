import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mks_racing/validator/validator.dart';

import '../main.dart';

class UserDetailScreen extends StatefulWidget {
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  String _timeString;
  Timer timer;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    super.initState();
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('hh:mm:ss').format(dateTime);
  }

  void _getTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  dispose() {
    timer.cancel();
    super.dispose();
  }

  bool isHiding = true;

  TextEditingController nameController =
      TextEditingController(text: 'User Name');
  TextEditingController emailController =
      TextEditingController(text: 'test1@test.com');
  TextEditingController phoneController =
      TextEditingController(text: '090078601');

  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
            top: ScreenUtil().setHeight(60),
          ),
          height: devHeight,
          width: devWidth,
          child: Column(
            children: [
              SizedBox(height: ScreenUtil().setHeight(50)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Full Name:',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300], offset: Offset(2, 4))
                        ]),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(50),
                    child: Center(
                      child: TextField(
                        onSubmitted: (_) => emailNode.requestFocus(),
                        textInputAction: TextInputAction.next,
                        controller: nameController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'Jaison',
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                            suffixIcon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email:',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300], offset: Offset(2, 4))
                        ]),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(50),
                    child: Center(
                      child: TextField(
                        onSubmitted: (_) => phoneNode.requestFocus(),
                        textInputAction: TextInputAction.next,
                        controller: emailController,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: 'yourname@gmail.com',
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                            suffixIcon: Icon(
                              Icons.check,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Mobile Number:',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[300], offset: Offset(2, 4))
                        ]),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(50),
                    child: Center(
                      child: TextField(
                        textInputAction: TextInputAction.next,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: '971569112334',
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                            suffixIcon: Icon(
                              Icons.phone,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(40)),
              Text(_timeString,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 22)),
              Spacer(),
              GestureDetector(
                onTap: () {
                  if (!validator(ValidatorType.firstName, nameController.text))
                    return Fluttertoast.showToast(
                        msg: 'Name length must be 4',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey[800],
                        textColor: Colors.white);
                  if (!validator(ValidatorType.email, emailController.text))
                    return Fluttertoast.showToast(
                        msg: 'Incorrect email format',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey[800],
                        textColor: Colors.white);
                  if (phoneController.text.isEmpty)
                    return Fluttertoast.showToast(
                        msg: 'Incorrect phone number',
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.grey[800],
                        textColor: Colors.white);
                  Navigator.of(context).pop();
                },
                child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: ScreenUtil().setHeight(45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[900]),
                    child: Text(
                      ' Update Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(18, allowFontScalingSelf: true),
                          fontWeight: FontWeight.w600),
                    )),
              ),
              Spacer(),
            ],
          ),
        ),
      )),
    );
  }
}
