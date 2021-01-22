import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/screens/landingPages/RacingScreen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';

class InnerRacingScreen extends StatefulWidget {
  @override
  _InnerRacingScreenState createState() => _InnerRacingScreenState();
}

class _InnerRacingScreenState extends State<InnerRacingScreen> {
  bool isFirstTileOpened = false;
  bool isSecondTileOpened = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarClock(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RaceCardTodayWidget(
                Provider.of<RaceCardTodayProvider>(context, listen: false)
                    .raceCardToday),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Container(
                color: Colors.white,
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  initiallyExpanded: isFirstTileOpened,
                  children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(5),
                            horizontal: ScreenUtil().setWidth(10)),
                        color: Colors.white,
                        child: Column(children: [
                          GestureDetector(
                            onTap: () => pushNewScreen(
                              context,
                              screen: RacingScreen(),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(15)),
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Newcastle',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true))),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'F',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 2,
                                            color: Colors.grey,
                                          )),
                                          child: Text(
                                            'H',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(10)),
                                      Text('2 m',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          GestureDetector(
                            onTap: () =>
                                pushNewScreen(context, screen: RacingScreen()),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(15)),
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Wolverhampton',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true))),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'F',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 2,
                                            color: Colors.grey,
                                          )),
                                          child: Text(
                                            'H',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(10)),
                                      Text('17 m',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ]))
                  ],
                  onExpansionChanged: (val) =>
                      setState(() => isFirstTileOpened = val),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/Artboard 12.png'),
                  ),
                  title: Text(
                    'United Kingdom',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            ScreenUtil().setSp(18, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(30),
                    color: Colors.blue[900],
                    child: Center(
                      child: Icon(isFirstTileOpened ? Icons.remove : Icons.add,
                          color: Colors.grey, size: 30),
                    ),
                  ),
                )),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Container(
                color: Colors.white,
                child: ExpansionTile(
                  backgroundColor: Colors.white,
                  initiallyExpanded: isSecondTileOpened,
                  children: [
                    Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(5),
                            horizontal: ScreenUtil().setWidth(10)),
                        color: Colors.white,
                        child: Column(children: [
                          GestureDetector(
                            onTap: () => pushNewScreen(
                              context,
                              screen: RacingScreen(),
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(15)),
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Newcastle',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true))),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'F',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 2,
                                            color: Colors.grey,
                                          )),
                                          child: Text(
                                            'H',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(10)),
                                      Text('2 m',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: ScreenUtil().setHeight(10)),
                          GestureDetector(
                            onTap: () =>
                                pushNewScreen(context, screen: RacingScreen()),
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setWidth(15)),
                              alignment: Alignment.center,
                              height: ScreenUtil().setHeight(50),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300].withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Wolverhampton',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true))),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          child: Text(
                                            'F',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      Container(
                                          width: ScreenUtil().setWidth(30),
                                          height: ScreenUtil().setHeight(30),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                            width: 2,
                                            color: Colors.grey,
                                          )),
                                          child: Text(
                                            'H',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: ScreenUtil().setSp(16,
                                                    allowFontScalingSelf:
                                                        true)),
                                          )),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(10)),
                                      Text('17 m',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true)))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ]))
                  ],
                  onExpansionChanged: (val) =>
                      setState(() => isSecondTileOpened = val),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/Artboard 12 copy.png'),
                  ),
                  title: Text(
                    'England',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize:
                            ScreenUtil().setSp(18, allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(30),
                    color: Colors.blue[900],
                    child: Center(
                      child: Icon(isSecondTileOpened ? Icons.remove : Icons.add,
                          color: Colors.grey, size: 30),
                    ),
                  ),
                )),
            SizedBox(height: ScreenUtil().setHeight(5)),
          ],
        ),
      ),
    );
  }
}
