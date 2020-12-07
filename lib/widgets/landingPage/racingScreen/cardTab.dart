import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/screens/racingScreen/playerScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../../../main.dart';

class CardTab extends StatefulWidget {
  @override
  _CardTabState createState() => _CardTabState();
}

class _CardTabState extends State<CardTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: ScreenUtil().setHeight(20),
          width: ScreenUtil().setWidth(411),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(411/6),
                color: Colors.blue[900],
                child: Text(
                  'Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(411/6),
                color: Colors.white,
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width:ScreenUtil().setWidth(411/6),
                color: Colors.blue[900],
                child: Text(
                  'Draw',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(411/6),
                color: Colors.white,
                child: Text(
                  'Age',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(411/6),
                color: Colors.blue[900],
                child: Text(
                  'Weight',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: ScreenUtil().setHeight(20),
                width: ScreenUtil().setWidth(411/6),
                color: Colors.white,
                child: Text(
                  'Rating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Container(
          color: Colors.white,
          height: ScreenUtil().setHeight(70),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: ()=>pushNewScreen(
                            context,
                            screen: PlayerScreen()
                          ),
                          child: Image.asset('assets/jockie.png')),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '1',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(28,allowFontScalingSelf: true))),
                            TextSpan(
                                text: '(4)',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(10,allowFontScalingSelf: true)))
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
                                    fontSize: ScreenUtil().setSp(8,allowFontScalingSelf: true)))
                          ]),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(2)),
                        Text('Tapit (USA) Los Ojitos (USA) by Mr Greelay (USA)',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: ScreenUtil().setSp(8,allowFontScalingSelf: true))),
                        SizedBox(height: ScreenUtil().setHeight(2)),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Trainer: Jaber Ramdhan',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: ScreenUtil().setSp(8,allowFontScalingSelf: true))),
                            TextSpan(
                                text: '47(1-40-3)',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize:  ScreenUtil().setSp(6,allowFontScalingSelf: true)))
                          ]),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(2)),
                        Text('Mr Abdul Hussain Abdul Hussain Alhermi',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true)))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset('assets/player.png'),
                        Column(
                          children: [
                            Text('TT OR:62',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true))),
                            SizedBox(height: ScreenUtil().setHeight(2)),
                            Text('59.0 KGs',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w900,
                                    fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true))),
                            SizedBox(height: ScreenUtil().setHeight(2)),
                            Text('Tadhg 0 Shea',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true))),
                            SizedBox(height: ScreenUtil().setHeight(2)),
                            Text('47(1-40-3)',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true)))
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
                    'LifeTime: 1|0-0-0| D:D|0-0-0| T:0|0-0-0|  AW: 1|0-0-0 D5:0|1-0-0|  UAE 0(0-0-0)',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(2)),
                      Container(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(2)),
                      Container(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(2)),
                      Container(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                      )
                    ],
                  ),
                  Text('TOTAL AED:00.00',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize:  ScreenUtil().setSp(8,allowFontScalingSelf: true),
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        FittedBox(
            child: DataTable(
                headingRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
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
                    fontSize:  ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Crs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Dist',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'TC',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Types',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Dts',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Time',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Jocky',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Wgt',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'PP',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Les',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'RS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'BLBy',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Kgs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Draw',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                    fontWeight: FontWeight.bold),
              ))
            ],
                rows: [
              DataRow(
                cells: [
                  DataCell(Text(
                    '02Aug 19',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  )),
                  DataCell(Text(
                    'Wob(A)',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '\$400',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '5',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    'Novice',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '2:40:70',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    'J Gordan',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  )),
                  DataCell(Text(
                    '58',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '5',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '15:25',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '5',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    'Trueshan',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  )),
                  DataCell(Text(
                    '58',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '9',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  ))
                ],
              ),
            ]))
      ],
    );
  }
}
