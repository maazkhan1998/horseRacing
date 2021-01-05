import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class FormTab extends StatefulWidget {
  @override
  _FormTabState createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: ScreenUtil().setHeight(20),
          width: double.infinity,
          color: Colors.blue[900],
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Race Record ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize:
                          ScreenUtil().setSp(10, allowFontScalingSelf: true),
                      fontWeight: FontWeight.w900)),
              TextSpan(
                  text: 'Jumps placings: 21/1502643-21',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(8, allowFontScalingSelf: true),
                  ))
            ]),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
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
                  fontSize: 14,
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
              'Jockey',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'Wg',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
            DataColumn(
                label: Text(
              'FP',
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
              'BtBY',
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
          rows: List.generate(
              8,
              (index) => DataRow(
                    color: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(1);
                      return Colors.white; // Use the default value.
                    }),
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
                          '▶️ 02 Aug 19',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        ),
                      )),
                      DataCell(Text(
                        'Wol(A)',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      )),
                      DataCell(Text(
                        '2400',
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
                            color: Colors.grey[700]),
                      )),
                      DataCell(Text(
                        '58',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue[900]),
                      )),
                      DataCell(Text(
                        '5',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      )),
                      DataCell(Text(
                        '15.25',
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
                            color: Colors.grey[700]),
                      )),
                      DataCell(Text(
                        '58',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      )),
                      DataCell(Text(
                        '3',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700]),
                      ))
                    ],
                  )),
        ))
      ],
    );
  }
}
