import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mks_racing/screens/landingPage.dart';
import 'package:mks_racing/validator/validator.dart';

import '../main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool isHiding=true;

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passController=TextEditingController();

  FocusNode emailNode=FocusNode();
  FocusNode phoneNode=FocusNode();
  FocusNode passNode=FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child:SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left:ScreenUtil().setWidth(20),right:ScreenUtil().setWidth(20),top:ScreenUtil().setHeight(60),bottom: ScreenUtil().setHeight(40)),
            height: devHeight,
            width:devWidth,
            child: Column(
              children: [
                Text('Create New Account',
                style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: ScreenUtil().setSp(26,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold),),SizedBox(height:ScreenUtil().setHeight(50)),
                        Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Full Name:',
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
                          onSubmitted: (_)=>emailNode.requestFocus(),
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
                ),SizedBox(height:ScreenUtil().setHeight(20)),
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
                          onSubmitted: (_)=>phoneNode.requestFocus(),
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
                ),SizedBox(height:ScreenUtil().setHeight(20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Mobile Number:',
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
                ),SizedBox(height:ScreenUtil().setHeight(20)),
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
                        onSubmitted: (_)=>FocusScope.of(context).unfocus(),
                        textInputAction: TextInputAction.done,
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
              ),SizedBox(height:ScreenUtil().setHeight(20)),
              GestureDetector(
                onTap: (){
                  if(!validator(ValidatorType.firstName,nameController.text)) return Fluttertoast.showToast(msg: 'Name length must be 4',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  if(!validator(ValidatorType.email,emailController.text)) return Fluttertoast.showToast(msg: 'Incorrect email format',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  if(phoneController.text.isEmpty) return Fluttertoast.showToast(msg: 'Incorrect phone number',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  if(!validator(ValidatorType.password,passController.text)) return Fluttertoast.showToast(msg: 'Password too weak',gravity: ToastGravity.BOTTOM,backgroundColor: Colors.grey[800],textColor: Colors.white);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_)=>LandingPage()
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
                        'Create New Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(18,allowFontScalingSelf: true),
                            fontWeight: FontWeight.w600),
                      )),
              ),
                    Spacer(),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'If you already have account ',
                            style: TextStyle(
                              color:Colors.grey,fontWeight: FontWeight.bold
                            )
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap=(){Navigator.of(context).pop();},
                            text: 'Login',
                            style: TextStyle(
                              color:Colors.blue[900],fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline
                            )
                          )
                        ]
                      ),
                    )
              ],
            ),
          ),
        )
      ),
    );
  }
}