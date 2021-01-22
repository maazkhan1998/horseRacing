import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/provider/raceCardTodayProvider.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/cardTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/drawTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/predictorTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/summaryTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/trackRecordTab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../apiURL.dart';
import '../../model/raceCardDetail.dart';

class RaceScreen extends StatefulWidget {
  final String raceCardId;

  RaceScreen(this.raceCardId);
  @override
  _RaceScreenState createState() => _RaceScreenState();
}

class _RaceScreenState extends State<RaceScreen>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  int totalvalues = 10;
  var dataKeyList = List.generate(10, (index) => GlobalKey());

  bool isTotalPriceExpanded = false;
  bool isDescriptionExpanded = false;
  bool isLoading = true;
  RaceCardDetail raceCardDetail;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    Future.delayed(Duration(seconds: 0), () async {
      try {
        final response = await http.get(raceCardDetailURL(widget.raceCardId),
            headers: {'ismobile': 'true'});
        if (response.statusCode == 200) {
          final data = json.decode(response.body) as Map<String, dynamic>;
          raceCardDetail = RaceCardDetail.fromJson(data);
          setState(() => isLoading = false);
        } else {
          setState(() => isLoading = false);
          Navigator.of(context).pop();
        }
      } catch (e) {
        setState(() => isLoading = false);
        Navigator.of(context).pop();
      }
    });
    super.initState();
  }

  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarClock(),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: Icon(Icons.arrow_back_ios,
                              color: Colors.white, size: 16),
                        ),
                        Text(raceCardDetail.data.raceName,
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
                              raceCardDetail.data.racecards.length,
                              (index) => GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedIndex = index),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(5)),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      key: dataKeyList[index],
                                      height: ScreenUtil().setHeight(50),
                                      width: ScreenUtil().setWidth(50),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              alignment: Alignment.center,
                                              height:
                                                  ScreenUtil().setHeight(35),
                                              width: ScreenUtil().setWidth(50),
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == index
                                                      ? Colors.red
                                                      : Colors.green,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(5),
                                                    topRight:
                                                        Radius.circular(5),
                                                  )),
                                              child: Text(
                                                raceCardDetail.data
                                                    .racecards[index].raceNo
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: ScreenUtil().setSp(
                                                        20,
                                                        allowFontScalingSelf:
                                                            true),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                          Container(
                                              alignment: Alignment.center,
                                              height:
                                                  ScreenUtil().setHeight(15),
                                              width: ScreenUtil().setWidth(50),
                                              decoration: BoxDecoration(
                                                  color: Colors.black87,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(5),
                                                    bottomRight:
                                                        Radius.circular(5),
                                                  )),
                                              child: Text(
                                                raceCardDetail.data
                                                    .racecards[index].raceTime,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: ScreenUtil().setSp(
                                                        12,
                                                        allowFontScalingSelf:
                                                            true),
                                                    fontWeight:
                                                        FontWeight.bold),
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
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
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
                            raceCardDetail.data.kindOfHorse,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil()
                                    .setSp(12, allowFontScalingSelf: true),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          height: ScreenUtil().setHeight(30),
                          width: ScreenUtil().setWidth(411 / 3),
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: Text(
                            raceCardDetail.data.raceKind,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil()
                                    .setSp(12, allowFontScalingSelf: true),
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
                            raceCardDetail.data.raceType,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil()
                                    .setSp(12, allowFontScalingSelf: true),
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(10)),
                  Container(
                    height: ScreenUtil().setHeight(80),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/Artboard 30.png',
                            height: ScreenUtil().setHeight(70),
                            width: ScreenUtil().setWidth(80)),
                        Text(raceCardDetail.data.raceName,
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontSize: ScreenUtil()
                                    .setSp(22, allowFontScalingSelf: true),
                                fontWeight: FontWeight.w500)),
                        CircularPercentIndicator(
                          percent: 0.7,
                          backgroundColor: Colors.red,
                          radius: 49,
                          center: Text(
                            raceCardDetail.data.distance.toString(),
                            style: TextStyle(
                                fontSize: ScreenUtil()
                                    .setSp(9, allowFontScalingSelf: true),
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                          progressColor: Colors.green,
                          footer: Text('Finish Line',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil().setSp(14))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  GestureDetector(
                    onTap: () => setState(
                        () => isTotalPriceExpanded = !isTotalPriceExpanded),
                    child: Container(
                        height: ScreenUtil().setHeight(20),
                        width: double.infinity,
                        color: Colors.blue[900],
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Total Prize (${raceCardDetail.data.totalPrize})',
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
                                  isTotalPriceExpanded
                                      ? Icons.remove
                                      : Icons.add,
                                  color: Colors.black87,
                                  size: 14),
                            )
                          ],
                        )),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  if (isTotalPriceExpanded)
                    Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setHeight(55),
                        width: ScreenUtil().setWidth(411),
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(15),
                            vertical: ScreenUtil().setHeight(5)),
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
                                          text: ' 🏆 ${index + 1}',
                                          style: TextStyle(
                                              color: Colors.blue[900],
                                              fontSize: ScreenUtil().setSp(16,
                                                  allowFontScalingSelf: true),
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'AED ' +
                                              raceCardDetail.data.firstPrize
                                                  .toString(),
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
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10)),
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
                                    isDescriptionExpanded
                                        ? Icons.remove
                                        : Icons.add,
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
                      width: ScreenUtil().setWidth(411),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(15),
                          vertical: ScreenUtil().setHeight(5)),
                      child: Text(raceCardDetail.data.raceDesc),
                    ),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  Container(
                      height: ScreenUtil().setHeight(30),
                      width: double.infinity,
                      color: Colors.white,
                      child: TabBar(
                        labelPadding: EdgeInsets.symmetric(horizontal: 0),
                        onTap: (_) => setState(() => controller.index = _),
                        indicatorColor: Colors.blue[900],
                        labelColor: Colors.blue[900],
                        labelStyle: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(10, allowFontScalingSelf: true)),
                        unselectedLabelStyle: TextStyle(
                            fontSize: ScreenUtil()
                                .setSp(10, allowFontScalingSelf: true)),
                        unselectedLabelColor: Colors.grey[700],
                        controller: controller,
                        tabs: [
                          Tab(text: 'Card'),
                          Tab(text: 'Predictor'),
                          Tab(text: 'Draw'),
                          Tab(text: 'Summary'),
                          Tab(text: 'Track Record'),
                        ],
                      )),
                  SizedBox(height: ScreenUtil().setHeight(5)),
                  if (controller.index == 0) CardTab(),
                  if (controller.index == 1) PredictorTab(),
                  if (controller.index == 2) DrawTab(),
                  if (controller.index == 3) SummaryTab(),
                  if (controller.index == 4) TrackRecordScreen()
                ],
              ),
            ),
    );
  }
}
