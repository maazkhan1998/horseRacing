import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class TrackRecordScreen extends StatefulWidget {
  @override
  _TrackRecordScreenState createState() => _TrackRecordScreenState();
}

class _TrackRecordScreenState extends State<TrackRecordScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                    fontSize: ScreenUtil().setSp(14,allowFontScalingSelf: true),
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
                  DataCell(Text(
                    '02Aug 19',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
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
    );
  }
}