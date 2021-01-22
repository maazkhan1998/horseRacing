import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:mks_racing/apiURL.dart';
import 'package:mks_racing/model/countries.dart';
import 'package:mks_racing/validator/validator.dart';

import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHiding = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode passNode = FocusNode();

  bool isLoading = false;

  DateTime dob;

  String countryselected = '';

  List<String> countryDropDown = [''];

  Countries selectedCountry;

  CountriesAPI countries;

  selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2022),
    );
    if (picked == null || picked == DateTime.now()) return;
    setState(() => dob = picked);
  }

  initState() {
    Future.delayed(Duration(seconds: 0), () async {
      final response =
          await http.get(countryURL, headers: {'ismobile': 'true'});
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        countries = CountriesAPI.fromJson(data);
        countries.data.forEach((element) {
          countryDropDown.add(element.name);
        });
        setState(() {});
      } else {
        Navigator.of(context).pop();
      }
    });
    super.initState();
  }

  onTap() async {
    if (!validator(ValidatorType.firstName, nameController.text))
      return Fluttertoast.showToast(
          msg: 'FirstName length must be 4',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    if (!validator(ValidatorType.firstName, lastNameController.text))
      return Fluttertoast.showToast(
          msg: 'LastName length must be 4',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    if (dob == null)
      return Fluttertoast.showToast(
          msg: 'Select date of birth',
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
    if (!validator(ValidatorType.password, passController.text))
      return Fluttertoast.showToast(
          msg: 'Password too weak',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    if (selectedCountry == null) {
      return Fluttertoast.showToast(
          msg: 'Select your country',
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    }
    setState(() => isLoading = true);
    try {
      final response = await http.post(signUpURL,
          headers: {'ismobile': 'true', 'Content-Type': 'application/json'},
          body: json.encode({
            "status": true,
            "firstName": nameController.text,
            "lastName": lastNameController.text,
            "dateOfBirth": dob.toIso8601String(),
            "nationality": selectedCountry.id,
            "contactNumber": phoneController.text,
            "email": emailController.text,
            "password": passController.text
          }));
      setState(() => isLoading = false);
      if (response.statusCode == 201) {
        return Fluttertoast.showToast(
            msg: 'User successfully created',
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey[800],
            textColor: Colors.white);
      } else {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return Fluttertoast.showToast(
            msg: data['message'].toString(),
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey[800],
            textColor: Colors.white);
      }
    } catch (e) {
      print('hello');
      setState(() => isLoading = false);
      return Fluttertoast.showToast(
          msg: e.toString(),
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.grey[800],
          textColor: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20),
            top: ScreenUtil().setHeight(60),
            bottom: ScreenUtil().setHeight(40)),
        child: Column(
          children: [
            Text(
              'Create New Account',
              style: TextStyle(
                  color: Colors.blue[900],
                  fontSize: ScreenUtil().setSp(26, allowFontScalingSelf: true),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: ScreenUtil().setHeight(50)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('First Name:',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
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
                Text('Last Name:',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
                      ]),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  child: Center(
                    child: TextField(
                      onSubmitted: (_) => emailNode.requestFocus(),
                      textInputAction: TextInputAction.next,
                      controller: lastNameController,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintText: 'Williams',
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
              children: [
                Text('Date Of Birth',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      dob == null
                          ? Text('Date of Birth',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600))
                          : Text(DateFormat('dd/MM/yyyy').format(dob),
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600)),
                      GestureDetector(
                          onTap: () => selectDate(context),
                          child: Icon(Icons.calendar_today, color: Colors.grey))
                    ],
                  ),
                )
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
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
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
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
                      ]),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  child: Center(
                    child: TextField(
                      onSubmitted: (_) => passNode.requestFocus(),
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
            SizedBox(height: ScreenUtil().setHeight(20)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Password:',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
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
                      onSubmitted: (_) => FocusScope.of(context).unfocus(),
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
                              onTap: () => setState(() => isHiding = !isHiding),
                              child: Icon(
                                isHiding ? Icons.lock : Icons.lock_open,
                                color: Colors.grey,
                              ))),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Country:',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold)),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey[300], offset: Offset(2, 4))
                    ],
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  width: double.infinity,
                  height: ScreenUtil().setHeight(50),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black87,
                        ),
                        value: countryselected,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w600),
                        items: countryDropDown
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            countryselected = value;
                          });
                          if (value == '') {
                            selectedCountry = null;
                          } else {
                            selectedCountry = countries.data
                                .firstWhere((element) => element.name == value);
                          }
                        }),
                  ),
                )
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(20)),
            GestureDetector(
              onTap: onTap,
              child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: ScreenUtil().setHeight(45),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[900]),
                  child: isLoading
                      ? CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        )
                      : Text(
                          'Create New Account',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(18, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w600),
                        )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'If you already have account ',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold)),
                TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.of(context).pop();
                      },
                    text: 'Login',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline))
              ]),
            )
          ],
        ),
      )),
    );
  }
}
