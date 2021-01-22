import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/screens/racingScreen/playerScreen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class RemainingRaceScreen extends StatefulWidget {
  @override
  _RemainingRaceScreenState createState() => _RemainingRaceScreenState();
}

class _RemainingRaceScreenState extends State<RemainingRaceScreen> {
  int selectedIndex = 0;
  int totalvalues = 10;
  var dataKeyList = List.generate(10, (index) => GlobalKey());
  bool isTotalExpanded = false;
  bool isDescriptionExpanded = false;
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
            SizedBox(height: ScreenUtil().setHeight(5)),
            Container(
              width: double.infinity,
              height: ScreenUtil().setHeight(40),
              color: Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios,
                        color: Colors.white, size: 16),
                  ),
                  Text('New Castle',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.w500)),
                  Text(
                    '19-11-200',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Container(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        totalvalues,
                        (index) => GestureDetector(
                            onTap: () => setState(() => selectedIndex = index),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                key: dataKeyList[index],
                                height: ScreenUtil().setHeight(50),
                                width: ScreenUtil().setWidth(50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        height: ScreenUtil().setHeight(35),
                                        width: ScreenUtil().setWidth(50),
                                        decoration: BoxDecoration(
                                            color: selectedIndex == index
                                                ? Colors.red
                                                : Colors.green,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5),
                                              topRight: Radius.circular(5),
                                            )),
                                        child: Text(
                                          index.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(20,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        height: ScreenUtil().setHeight(15),
                                        width: ScreenUtil().setWidth(50),
                                        decoration: BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Text(
                                          '20:15',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ScreenUtil().setSp(12,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ],
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (selectedIndex > 0) {
                            selectedIndex--;
                            print(selectedIndex);
                            setState(() {});
                            Scrollable.ensureVisible(
                                dataKeyList[selectedIndex].currentContext,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Card(
                          color: Colors.black87,
                          child:
                              Icon(Icons.arrow_back_ios, color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          if (selectedIndex < totalvalues) {
                            selectedIndex++;
                            print(selectedIndex);
                            setState(() {});
                            Scrollable.ensureVisible(
                                dataKeyList[selectedIndex].currentContext,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeIn);
                          }
                        },
                        child: Card(
                          color: Colors.black87,
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Container(
              height: ScreenUtil().setHeight(30),
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(411 / 3),
                    color: Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text(
                      'TB (Horse Kind)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(411 / 3),
                    color: Colors.white,
                    alignment: Alignment.center,
                    child: Text(
                      'Race Kind',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(30),
                    width: ScreenUtil().setWidth(411 / 3),
                    color: Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text(
                      'Race Type',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(16, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Container(
              width: devWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Artboard 30.png',
                      height: ScreenUtil().setHeight(70),
                      width: ScreenUtil().setWidth(80)),
                  Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/Artboard 14.png',
                              height: ScreenUtil().setHeight(50),
                              width: ScreenUtil().setWidth(80)),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          Image.asset('assets/Artboard 14.png',
                              height: ScreenUtil().setHeight(40),
                              width: ScreenUtil().setWidth(80))
                        ],
                      ),
                      Text('Race Name $selectedIndex',
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: ScreenUtil()
                                  .setSp(26, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w500)),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              const url = 'https://www.youtube.com/';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: Container(
                              height: ScreenUtil().setHeight(20),
                              width: ScreenUtil().setWidth(20),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[900],
                              ),
                            ),
                          ),
                          SizedBox(width: ScreenUtil().setWidth(5)),
                          CountdownTimer(
                            endTime: 60 * 60 * 60 * 10000000,
                            widgetBuilder: (context, time) {
                              return Container(
                                color: Colors.white,
                                alignment: Alignment.topCenter,
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(50),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Running Time',
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: ScreenUtil().setSp(12,
                                                allowFontScalingSelf: true))),
                                    Text(
                                        '${time.hours}:${time.min}:${time.sec}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: ScreenUtil().setSp(18,
                                                allowFontScalingSelf: true)))
                                  ],
                                ),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  CircularPercentIndicator(
                    percent: 0.7,
                    backgroundColor: Colors.red,
                    radius: 49,
                    center: Text(
                      '1900 dar',
                      style: TextStyle(
                          fontSize:
                              ScreenUtil().setSp(9, allowFontScalingSelf: true),
                          color: Colors.grey,
                          fontWeight: FontWeight.w500),
                    ),
                    progressColor: Colors.green,
                    footer: Text('Finish Line',
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            GestureDetector(
              onTap: () => setState(() => isTotalExpanded = !isTotalExpanded),
              child: Container(
                  height: ScreenUtil().setHeight(20),
                  width: double.infinity,
                  color: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Price',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(12, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w500)),
                      Container(
                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(15),
                          width: ScreenUtil().setWidth(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: Icon(
                              isTotalExpanded ? Icons.remove : Icons.add,
                              color: Colors.black87,
                              size: 14))
                    ],
                  )),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            if (isTotalExpanded)
              Container(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(55),
                  width: ScreenUtil().setWidth(411),
                  padding: EdgeInsets.symmetric(
                      horizontal: 15, vertical: ScreenUtil().setHeight(5)),
                  child: Wrap(
                    direction: Axis.horizontal,
                    runSpacing: 10,
                    spacing: 10,
                    alignment: WrapAlignment.spaceBetween,
                    children: List.generate(
                        6,
                        (index) => RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: '🏆${index + 1}',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: ScreenUtil().setSp(16,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: ' AED 46,500;',
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: ScreenUtil().setSp(14,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold))
                              ]),
                            )),
                  )),
            GestureDetector(
              onTap: () => setState(
                  () => isDescriptionExpanded = !isDescriptionExpanded),
              child: Container(
                  height: ScreenUtil().setHeight(20),
                  width: double.infinity,
                  color: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Race Description',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(12, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w500)),
                      Container(
                          alignment: Alignment.center,
                          height: ScreenUtil().setHeight(15),
                          width: ScreenUtil().setWidth(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2)),
                          child: Icon(
                              isDescriptionExpanded ? Icons.remove : Icons.add,
                              color: Colors.black87,
                              size: 14))
                    ],
                  )),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            if (isDescriptionExpanded)
              Container(
                  alignment: Alignment.centerLeft,
                  height: ScreenUtil().setHeight(55),
                  width: devWidth,
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(15),
                      vertical: ScreenUtil().setHeight(5)),
                  child: Text(
                      'Lorem Ipsum Description Lorem Ipsum Description Lorem Ipsum Description')),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Container(
              height: ScreenUtil().setHeight(20),
              width: devWidth,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.blue[900],
                    child: Text(
                      'Number',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.white,
                    child: Text(
                      'Name',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.blue[900],
                    child: Text(
                      'Draw',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.white,
                    child: Text(
                      'Age',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.blue[900],
                    child: Text(
                      'Weight',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setHeight(20),
                    width: ScreenUtil().setWidth(411 / 6),
                    color: Colors.white,
                    child: Text(
                      'Rating',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: ScreenUtil()
                              .setSp(12, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            ListView.separated(
              itemCount: 2,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              separatorBuilder: (context, index) =>
                  SizedBox(height: ScreenUtil().setHeight(5)),
              itemBuilder: (context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.white,
                    height: ScreenUtil().setHeight(85),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Image.asset('assets/jockie.png'),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: '1',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(29,
                                                  allowFontScalingSelf: true))),
                                      TextSpan(
                                          text: '(4)',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(10,
                                                  allowFontScalingSelf: true)))
                                    ]),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => pushNewScreen(
                                                context,
                                                screen: PlayerScreen()),
                                          text: 'LITECOIN',
                                          style: TextStyle(
                                            color: Colors.blue[900],
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                          text: '  (1RE) Syrs. GR G (242)',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true)))
                                    ]),
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(2)),
                                  Text(
                                      'Tapit (USA) Los Ojitos (USA) by Mr Greelay (USA)',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(8,
                                              allowFontScalingSelf: true))),
                                  SizedBox(height: ScreenUtil().setHeight(2)),
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => pushNewScreen(
                                                context,
                                                screen: PlayerScreen()),
                                          text: 'Trainer: Jaber Ramdhan',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true))),
                                      TextSpan(
                                          text: '47(1-40-3)',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(6,
                                                  allowFontScalingSelf: true)))
                                    ]),
                                  ),
                                  SizedBox(height: ScreenUtil().setHeight(2)),
                                  Text('Mr Abdul Hussain Abdul Hussain Alhermi',
                                      style: TextStyle(
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(8,
                                              allowFontScalingSelf: true)))
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                      onTap: () => pushNewScreen(context,
                                          screen: PlayerScreen()),
                                      child: Image.asset('assets/player.png')),
                                  Column(
                                    children: [
                                      Text('TT OR:62',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true))),
                                      SizedBox(
                                          height: ScreenUtil().setHeight(2)),
                                      Text('59.0 KGs',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w900,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true))),
                                      SizedBox(
                                          height: ScreenUtil().setHeight(2)),
                                      Text('Tadhg 0 Shea',
                                          style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true))),
                                      SizedBox(
                                          height: ScreenUtil().setHeight(2)),
                                      Text('47',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true))),
                                      SizedBox(
                                          height: ScreenUtil().setHeight(2)),
                                      Text('(1-40-3)',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: ScreenUtil().setSp(8,
                                                  allowFontScalingSelf: true)))
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'LifeTime: 1|0-0-0| D:D|0-0-0| T:0|0-0-0|\nAW: 1|0-0-0 D5:0|1-0-0|\nUAE 0(0-0-0)',
                              style: TextStyle(
                                  color: Colors.blue[900],
                                  fontSize: ScreenUtil()
                                      .setSp(8, allowFontScalingSelf: true),
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  height: ScreenUtil().setHeight(10),
                                  width: ScreenUtil().setWidth(10),
                                  alignment: Alignment.center,
                                  child: Text('C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Colors.blue[900],
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(2)),
                                Container(
                                  height: ScreenUtil().setHeight(10),
                                  width: ScreenUtil().setWidth(10),
                                  alignment: Alignment.center,
                                  child: Text('C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(2)),
                                Container(
                                  height: ScreenUtil().setHeight(10),
                                  width: 10,
                                  alignment: Alignment.center,
                                  child: Text('C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Colors.black87,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(2)),
                                Container(
                                  height: ScreenUtil().setHeight(10),
                                  width: ScreenUtil().setWidth(10),
                                  alignment: Alignment.center,
                                  child: Text('C',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      )),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(5)),
                                Text('TOTAL AED:00.00',
                                    style: TextStyle(
                                        color: Colors.blue[900],
                                        fontSize: ScreenUtil().setSp(8,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  FittedBox(
                      child: DataTable(
                          headingRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(1);
                            return Colors.black87; // Use the default value.
                          }),
                          columnSpacing: 10,
                          columns: [
                        // which widget is this
                        DataColumn(
                            label: Text(
                          'Date',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: ScreenUtil()
                                  .setSp(14, allowFontScalingSelf: true),
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Crs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Dist',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'TC',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Types',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Dts',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Time',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Jocky',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Wgt',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'PP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Les',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'RS',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'BLBy',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Kgs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        )),
                        DataColumn(
                            label: Text(
                          'Draw',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ))
                      ],
                          rows: [
                        DataRow(
                          cells: [
                            DataCell(GestureDetector(
                              onTap: () async {
                                const url = 'https://www.youtube.com/';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Text(
                                '▶️02Aug 19',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[900]),
                              ),
                            )),
                            DataCell(Text(
                              'Wob(A)',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '\$400',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              'Novice',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '2:40:70',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              'J Gordan',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            )),
                            DataCell(Text(
                              '58',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '15:25',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '5',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              'Trueshan',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[900]),
                            )),
                            DataCell(Text(
                              '58',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            )),
                            DataCell(Text(
                              '9',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[700]),
                            ))
                          ],
                        ),
                      ]))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
