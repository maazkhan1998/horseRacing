import 'package:flutter/material.dart';
import 'package:mks_racing/widgets/custom.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:5),
            ListTile(
                tileColor: Colors.white,
                leading: Text('My Selection',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5),
              ListTile(
                tileColor: Colors.white,
                leading: Text('My Stanting',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5),
              ListTile(
                tileColor: Colors.white,
                leading: Text('Change Password',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5),
              ListTile(
                tileColor: Colors.white,
                leading: Text('- -',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5),
              ListTile(
                tileColor: Colors.white,
                leading: Text('Shop',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5),
              ListTile(
                tileColor: Colors.white,
                leading: Text('Edit Information',style: TextStyle(
                  color:Colors.black87,fontSize: 18,fontWeight: FontWeight.w500
                ),),
              ),SizedBox(height:5)
          ],
        )
      ),
    );
  }
}