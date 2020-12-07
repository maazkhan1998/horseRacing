import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/widgets/custom.dart';

class Top10Screen extends StatefulWidget {
  @override
  _Top10ScreenState createState() => _Top10ScreenState();
}

class _Top10ScreenState extends State<Top10Screen> {

     var yearDropDown=['Any','Any1','Any2'];
  var yearselected='Any';

  var horseDropDown=['Any','Any1','Any2'];
  var horseselected='Any';

  var raceDropDown=['Any','Any1','Any2'];
  var raceselected='Any';

  var groundDropDown=['Any','Any1','Any2'];
  var groundselected='Any';

  var lengthDropDown=['Any','Any1','Any2'];
  var lengthselected='Any';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:5),
            Container(
              height:ScreenUtil().setHeight(50),width:double.infinity,
              color: Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,color:Colors.white,size:16
                  ),
                  Text(
                    'Top 10 Owners',style: TextStyle(
                      color:Colors.white70,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),
                    ),
                  ),
                  Text('')
                ],
              ),
            ),SizedBox(height:ScreenUtil().setHeight(5)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(74),width:ScreenUtil().setWidth(80),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color:Colors.blue[900],width: 2
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Year',style: TextStyle(
                        color:Colors.black87,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      ),),
                      DropdownButton<String>(
                        iconSize: 16,
                        hint: Text(yearselected,style: TextStyle(color: Colors.deepOrange),),
                      items:yearDropDown.map((String item){
                        return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(color: Colors.black,fontSize:10),),
                        ); 
                      }).toList(),
                      onChanged: (String selectedValue){
                        setState(() {
                          yearselected=selectedValue;
                        });
                      },value: yearselected,
                    )
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(74),width:ScreenUtil().setWidth(80),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color:Colors.blue[900],width: 2
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Horse Kind',style: TextStyle(
                        color:Colors.black87,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      ),),
                      DropdownButton<String>(
                        iconSize: 16,
                        hint: Text(horseselected,style: TextStyle(color: Colors.deepOrange),),
                      items:horseDropDown.map((String item){
                        return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(color: Colors.black,fontSize:10),),
                        ); 
                      }).toList(),
                      onChanged: (String selectedValue){
                        setState(() {
                          horseselected=selectedValue;
                        });
                      },value: horseselected,
                    )
                    ],
                  )
                ),
                                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(74),width:ScreenUtil().setWidth(80),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color:Colors.blue[900],width: 2
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Race Course',style: TextStyle(
                        color:Colors.black87,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      ),),
                      DropdownButton<String>(
                        iconSize: 16,
                        hint: Text(raceselected,style: TextStyle(color: Colors.deepOrange),),
                      items:raceDropDown.map((String item){
                        return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(color: Colors.black,fontSize:10),),
                        ); 
                      }).toList(),
                      onChanged: (String selectedValue){
                        setState(() {
                          raceselected=selectedValue;
                        });
                      },value: raceselected,
                    )
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(74),width:ScreenUtil().setWidth(80),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color:Colors.blue[900],width: 2
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Ground',style: TextStyle(
                        color:Colors.black87,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      ),),
                       DropdownButton<String>(
                        iconSize: 16,
                        hint: Text(groundselected,style: TextStyle(color: Colors.deepOrange),),
                      items:groundDropDown.map((String item){
                        return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(color: Colors.black,fontSize:10),),
                        ); 
                      }).toList(),
                      onChanged: (String selectedValue){
                        setState(() {
                          groundselected=selectedValue;
                        });
                      },value: groundselected,
                    )
                    ],
                  )
                ),
                Container(
                  alignment: Alignment.center,
                  height:ScreenUtil().setHeight(74),width:ScreenUtil().setWidth(80),
                  decoration:BoxDecoration(
                    border: Border.all(
                      color:Colors.blue[900],width: 2
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ) ,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('length',style: TextStyle(
                        color:Colors.black87,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true)
                      ),),
                      DropdownButton<String>(
                        iconSize: 16,
                        hint: Text(lengthselected,style: TextStyle(color: Colors.deepOrange),),
                      items:lengthDropDown.map((String item){
                        return DropdownMenuItem<String>(
            value: item,
            child: Text(item,style: TextStyle(color: Colors.black,fontSize:10),),
                        ); 
                      }).toList(),
                      onChanged: (String selectedValue){
                        setState(() {
                          lengthselected=selectedValue;
                        });
                      },value: lengthselected,
                    )
                    ],
                  )
                )
              ],
            ),SizedBox(height:10),
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
                'Trainer',
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
                'Places',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Win%',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Place%',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Win P/L',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'EW P/L',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'A/E',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'IV',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              )),
            ],
                rows: List.generate(5, (index) => DataRow(
                  color: index%2==0?MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.blue[200].withOpacity(0.3); // Use the default value.
                }):MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.white; // Use the default value.
                }),
                cells: [
                  DataCell(Text(
                    'P Nichoolas',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  )),
                  DataCell(Text(
                    '63',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '24',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '36',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '28.10',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '57.14',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '24.94',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '31.84',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[900]),
                  )),
                  DataCell(Text(
                    '1.35',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '3.96',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                ],
              ))
              ,
            ))
          ],
        )
      ),
    );
  }
}