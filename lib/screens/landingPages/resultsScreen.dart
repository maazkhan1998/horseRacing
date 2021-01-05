import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/screens/racingScreen/remainingRaceScreen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomStaticWidget.formWidget(context),
              SizedBox(height: ScreenUtil().setHeight(5)),
              Container(
                  color: Colors.white,
                  child: ExpansionTile(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 3,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: ScreenUtil().setHeight(5)),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => pushNewScreen(context,
                              screen: RemainingRaceScreen()),
                          child: Container(
                              height: ScreenUtil().setHeight(80),
                              alignment: Alignment.center,
                              color: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setHeight(5),
                                  horizontal: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '1:15',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ScreenUtil().setSp(22,
                                            allowFontScalingSelf: true),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '1st   The Big Breakway 4/9f',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: ScreenUtil().setSp(16,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '2nd   Doc Penfro 12/1',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: ScreenUtil().setSp(16,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '3rd   The Butcher said 8/1',
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontSize: ScreenUtil().setSp(16,
                                                allowFontScalingSelf: true),
                                            fontWeight: FontWeight.w500),
                                      )
                                    ],
                                  ),
                                  Icon(Icons.arrow_forward_ios,
                                      color: Colors.grey[400], size: 30)
                                ],
                              )),
                        ),
                      )
                    ],
                    backgroundColor: Colors.white,
                    initiallyExpanded: isSecondTileOpened,
                    onExpansionChanged: (val) =>
                        setState(() => isSecondTileOpened = val),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/Artboard 12.png'),
                    ),
                    title: Text(
                      'United Kingdom',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil()
                              .setSp(18, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      height: ScreenUtil().setHeight(30),
                      width: ScreenUtil().setWidth(30),
                      color: Colors.blue[900],
                      child: Center(
                        child: Icon(
                            !isSecondTileOpened ? Icons.add : Icons.remove,
                            color: Colors.grey,
                            size: 30),
                      ),
                    ),
                  )),
              SizedBox(height: ScreenUtil().setHeight(10)),
              Container(
                  color: Colors.white,
                  child: ExpansionTile(
                    backgroundColor: Colors.white,
                    initiallyExpanded: isFirstTileOpened,
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: 3,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: ScreenUtil().setHeight(5)),
                        itemBuilder: (context, index) => Container(
                            height: ScreenUtil().setHeight(80),
                            alignment: Alignment.center,
                            color: Colors.white,
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setHeight(5),
                                horizontal: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '1:15',
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: ScreenUtil().setSp(22,
                                          allowFontScalingSelf: true),
                                      fontWeight: FontWeight.bold),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '1st   The Big Breakway 4/9f',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '2nd   Doc Penfro 12/1',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      '3rd   The Butcher said 8/1',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: ScreenUtil().setSp(16,
                                              allowFontScalingSelf: true),
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios,
                                    color: Colors.grey[400], size: 30)
                              ],
                            )),
                      )
                    ],
                    onExpansionChanged: (val) =>
                        setState(() => isFirstTileOpened = val),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/Artboard 12 copy.png'),
                    ),
                    title: Text(
                      'England',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil()
                              .setSp(18, allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Container(
                      height: ScreenUtil().setHeight(30),
                      width: ScreenUtil().setWidth(30),
                      color: Colors.blue[900],
                      child: Center(
                        child: Icon(
                            isFirstTileOpened ? Icons.remove : Icons.add,
                            color: Colors.grey,
                            size: 30),
                      ),
                    ),
                  )),
              SizedBox(height: ScreenUtil().setHeight(10)),
            ],
          ),
        ));
  }
}
