import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mks_racing/screens/alertScreen.dart';
import 'package:mks_racing/screens/signUpScreen.dart';
import 'package:mks_racing/validator/validator.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isHiding = true;
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  FocusNode passNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,designSize:Size(411,683));
    devHeight = MediaQuery.of(context).size.height;
    devWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20), vertical: ScreenUtil().setHeight(60)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                'assets/Artboard 6 copy 3.png',
                height: ScreenUtil().setHeight(125),
                width: ScreenUtil().setWidth(175),
              )),
              SizedBox(height: ScreenUtil().setHeight(30)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Email:',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
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
                        onSubmitted: (_)=>passNode.requestFocus(),
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
              SizedBox(height: ScreenUtil().setHeight(25)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Password:',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
                      ],
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    height: ScreenUtil().setHeight(50),
                    child: Center(
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        onSubmitted: (_)=>FocusScope.of(context).unfocus(),
                        controller: passController,
                        obscureText: isHiding,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: '* * * * * * * * *',
                            hintStyle: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w600),
                            suffixIcon: GestureDetector(
                                onTap: () =>
                                    setState(() => isHiding = !isHiding),
                                child: Icon(
                                  isHiding ? Icons.lock : Icons.lock_open,
                                  color: Colors.grey,
                                ))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(35)),
              GestureDetector(
                onTap: (){
                  if(!validator(ValidatorType.email,emailController.text)) return Fluttertoast.showToast(msg: 'Incorrect email format',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  if(!validator(ValidatorType.password,passController.text)) return Fluttertoast.showToast(msg: 'Password too weak',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=>AlertScreen()
                    )
                  );
                },
                              child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: ScreenUtil().setHeight(45),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blue[900]),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(18,allowFontScalingSelf: true),
                          fontWeight: FontWeight.w600),
                    )),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Center(
                child: Text(
                  'Forgot password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(40)),
              Row(
                children: [
                  Expanded(
                      child: Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                  )),
                  Text(
                    '  or  ',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                      child: Divider(
                    color: Colors.grey[300],
                    thickness: 2,
                  ))
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(30)),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => SignUpScreen())),
                child: Center(
                    child: Text(
                  'Create New Account',
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: ScreenUtil().setSp(26,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                )),
              ),
              SizedBox(height: ScreenUtil().setHeight(5)),
              Center(
                  child: Text(
                "Contact support if you can't log in",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      )),
    );
  }
}
