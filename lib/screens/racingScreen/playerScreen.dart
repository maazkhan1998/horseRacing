import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/playerScreen/formTab.dart';

class PlayerScreen extends StatefulWidget {
  @override
  _PlayerScreenState createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen>
    with SingleTickerProviderStateMixin {
  initState() {
    controller = TabController(length: 3, vsync: this);
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
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomStaticWidget.formWidget(context),
          SizedBox(height: ScreenUtil().setHeight(5)),
          Container(
              height: ScreenUtil().setHeight(40),
              width: double.infinity,
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              color: Colors.blue[900],
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  Text(
                    'CHRIS GORDAN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            ScreenUtil().setSp(16, allowFontScalingSelf: true),
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(20),
                      width: ScreenUtil().setWidth(70),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)),
                      child: Text('Track Horse',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: ScreenUtil()
                                  .setSp(10, allowFontScalingSelf: true),
                              fontWeight: FontWeight.w500)))
                ],
              )),
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
                '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Runs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Wins',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                '%',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'PLACED',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'WINNINGS/HORSES',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'TOTAL EARNINGS',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                '\$1 TAKE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'BEST IN CATEGORY',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'RPR',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
            ],
            rows: List.generate(
                4,
                (index) => DataRow(
                      color: index == 1
                          ? MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(1);
                              return Colors.blue[200]
                                  .withOpacity(0.3); // Use the default value.
                            })
                          : MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered))
                                return Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(1);
                              return Colors.white; // Use the default value.
                            }),
                      cells: [
                        DataCell(Text(
                          'Hurdle',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '63',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '1',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '2',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '1',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '\$3.769',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '\$3.769',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          '116',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                        DataCell(Text(
                          'Commanche Red',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[900]),
                        )),
                        DataCell(Text(
                          '97',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[700]),
                        )),
                      ],
                    )),
          )),
          SizedBox(height: ScreenUtil().setHeight(10)),
          Container(
            height: ScreenUtil().setHeight(30),
            color: Colors.white,
            child: TabBar(
                onTap: (_) => setState(() => controller.index = _),
                indicatorWeight: 3,
                indicatorColor: Colors.blue[900],
                labelColor: Colors.blue[900],
                unselectedLabelColor: Colors.grey,
                controller: controller,
                tabs: [
                  Tab(text: 'Form'),
                  Tab(text: 'Entries'),
                  Tab(text: 'Horses')
                ]),
          ),
          SizedBox(height: 15),
          if (controller.index == 0) FormTab(),
          if (controller.index == 1) FormTab(),
          if (controller.index == 2) FormTab()
        ],
      )),
    );
  }
}
