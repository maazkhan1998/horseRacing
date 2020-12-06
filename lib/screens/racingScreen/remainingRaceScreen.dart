import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../main.dart';

class RemainingRaceScreen extends StatefulWidget {
  @override
  _RemainingRaceScreenState createState() => _RemainingRaceScreenState();
}

class _RemainingRaceScreenState extends State<RemainingRaceScreen> {

  int selectedIndex = 0;
  int totalvalues = 10;
  var dataKeyList = List.generate(10, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
              child: Column(
         mainAxisSize: MainAxisSize.min,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CustomStaticWidget.formWidget(context),SizedBox(height:5),
           Container(
              width:double.infinity,height:40,
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal:10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: ()=>Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios,color:Colors.white,size:16),
                  ),
                  Text('New Castle',style:TextStyle(
                    color: Colors.white,fontSize:16,fontWeight: FontWeight.w500
                  )),
                  Text('19-11-200',style:TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),SizedBox(height:10),
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
                (index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal:5),
                                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(5),
                    ),
                    key: dataKeyList[index],
                    height: 50,
                    width: 50,
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height:35,width: 50,
                          decoration: BoxDecoration(
                            color:selectedIndex == index ? Colors.red : Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),topRight: Radius.circular(5),
                            )
                          ),
                          child:Text(index.toString(),style: TextStyle(
                            color:Colors.white,fontSize: 20,fontWeight:FontWeight.bold
                          ),)
                        ),
                        Container(
                          alignment: Alignment.center,
                          height:15,width: 50,
                          decoration: BoxDecoration(
                            color:Colors.black87,
                            borderRadius: BorderRadius.only(
                              bottomLeft:Radius.circular(5),bottomRight: Radius.circular(5),
                            )
                          ),
                          child:Text('20:15',style: TextStyle(
                            color:Colors.white,fontSize: 12,fontWeight:FontWeight.bold
                          ),)
                        )
                      ],
                    ),
                  ),
                ),
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
                  child: Icon(Icons.arrow_back_ios,color:Colors.white),
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
                  child: Icon(Icons.arrow_forward_ios,color:Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    ),
            SizedBox(height:5),
            Container(
              height:30,width:double.infinity,
              child: Row(
                children: [
                  Container(
                    height:30,width:devWidth/3,
                    color:Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text('TB (Horse Kind)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.white,fontSize: 16,fontWeight:FontWeight.bold
                  ),),
                  ),
                  Container(
                    height:30,width:devWidth/3,
                    color:Colors.white,
                    alignment: Alignment.center,
                    child: Text('Race Kind',
                    style: TextStyle(
                    color:Colors.black,fontSize: 16,fontWeight:FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                  ),
                  Container(
                    height:30,width:devWidth/3,
                    color:Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text('Race Type',
                    style: TextStyle(
                    color:Colors.white,fontSize: 16,fontWeight:FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),SizedBox(height:10),
            Container(
              width: devWidth,
                          child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/Artboard 30.png',height:70,width:80),
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/Artboard 14.png',height:50,width:80),SizedBox(width:5),
                             Image.asset('assets/Artboard 14.png',height:40,width:80)
                          ],
                        ),
                        Text('Race Name',
                    style:TextStyle(
                      color:Colors.blue[900],fontSize: 26,fontWeight: FontWeight.w500
                    )),Row(
                      children: [
                        Container(
                          height:20,width:20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,color:Colors.blue[900],
                          ),
                        ),SizedBox(width:5),
                        CountdownTimer(
                    endTime: 60*60*60*10000000,
                    widgetBuilder: (context,time){
                     return Container(
                       color:Colors.white,
                        alignment: Alignment.topCenter,
                        width:100,height:50,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Running Time',style:TextStyle(
                                color:Colors.black87,fontSize: 12
                              )
                            ),
                            Text(
                      '${time.hours}:${time.min}:${time.sec}',
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        color:Colors.black,fontWeight:FontWeight.bold,fontSize: 18
                      )
                      )
                          ],
                        ),
                      );
                    },
                  )
                      ],
                    )
                      ],
                    )
                    ,
                    CircularPercentIndicator(
                      percent: 0.7,
                      backgroundColor: Colors.red,
                      radius: 49,
                      center: Text('1900 dar',
                      style: TextStyle(
                        fontSize:9,color:Colors.grey,fontWeight: FontWeight.w500
                      ),
                    ),
                    progressColor: Colors.green,
                    footer: Text('Finish Line',
                    style:TextStyle(
                      color:Colors.green,fontWeight:FontWeight.bold
                    )),
                    )],
                ),
            ),
            SizedBox(height:5),
            Container(
              height:20,width:double.infinity,
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price',style:TextStyle(
                    color:Colors.white,fontSize:12,fontWeight: FontWeight.w500
                  )),
                  Container(
                    alignment: Alignment.center,
                    height:15,width:15,
                    decoration: BoxDecoration(
                      color:Colors.white,borderRadius:BorderRadius.circular(2)
                    ),
                    child:Icon(Icons.remove,color:Colors.black87,size:14)
                  )
                ],
              )
            ),SizedBox(height:5),
            Container(
              alignment: Alignment.center,
              height:55,width:devWidth,
              padding: EdgeInsets.symmetric(
                horizontal:15,vertical:5
              ),
              child:Wrap(
                direction: Axis.horizontal,
                runSpacing: 10,
                spacing:10,
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(6,(index)=>
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:'${index+1}',style: TextStyle(color:Colors.blue[900],fontSize:16,fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text:' AED 46,500;',style: TextStyle(color:Colors.grey[700],fontSize:14,fontWeight: FontWeight.bold)
                      )
                    ]
                  ),
                )),
              )
            ),
            Container(
              height:20,width:double.infinity,
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: 10),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Race Description',style:TextStyle(
                    color:Colors.white,fontSize:12,fontWeight: FontWeight.w500
                  )),
                  Container(
                    alignment: Alignment.center,
                    height:15,width:15,
                    decoration: BoxDecoration(
                      color:Colors.white,borderRadius:BorderRadius.circular(2)
                    ),
                    child:Icon(Icons.add,color:Colors.black87,size:14)
                  )
                ],
              )
            ),SizedBox(height:5),

            Container(
          height: 20,
          width: devWidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.blue[900],
                child: Text(
                  'Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.white,
                child: Text(
                  'Name',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.blue[900],
                child: Text(
                  'Draw',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.white,
                child: Text(
                  'Age',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.blue[900],
                child: Text(
                  'Weight',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 20,
                width: devWidth / 6,
                color: Colors.white,
                child: Text(
                  'Rating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),SizedBox(height:5),
        ListView.separated(
          itemCount: 2,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          separatorBuilder: (context,index)=>SizedBox(height:5),
          itemBuilder: (context,index)=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
          color: Colors.white,
          height: 70,
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
                                    fontSize: 28)),
                            TextSpan(
                                text: '(4)',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10))
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
                                    fontSize: 8))
                          ]),
                        ),
                        SizedBox(height: 2),
                        Text('Tapit (USA) Los Ojitos (USA) by Mr Greelay (USA)',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 8)),
                        SizedBox(height: 2),
                        RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Trainer: Jaber Ramdhan',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8)),
                            TextSpan(
                                text: '47(1-40-3)',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 6))
                          ]),
                        ),
                        SizedBox(height: 2),
                        Text('Mr Abdul Hussain Abdul Hussain Alhermi',
                            style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                                fontSize: 8))
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
                                    fontSize: 8)),
                            SizedBox(height: 2),
                            Text('59.0 KGs',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.w900,
                                    fontSize: 8)),
                            SizedBox(height: 2),
                            Text('Tadhg 0 Shea',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8)),
                            SizedBox(height: 2),
                            Text('47(1-40-3)',
                                style: TextStyle(
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8))
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
                        fontSize: 8,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.blue[900],
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: 2),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: 2),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      SizedBox(width: 2),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(2)),
                      )
                    ],
                  ),
                  Text('TOTAL AED:00.00',
                      style: TextStyle(
                          color: Colors.blue[900],
                          fontSize: 8,
                          fontWeight: FontWeight.bold))
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 5),
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
          ),
        )
         ],
        ),
      ),
    );
  }
}