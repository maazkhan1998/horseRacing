import 'package:flutter/material.dart';
import 'package:mks_racing/main.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/cardTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/drawTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/predictorTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/summaryTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/trackRecordTab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SuperFectaTabBar extends StatefulWidget {
  @override
  _SuperFectaTabBarState createState() => _SuperFectaTabBarState();
}

class _SuperFectaTabBarState extends State<SuperFectaTabBar> with SingleTickerProviderStateMixin{

  TabController controller;

  initState(){
    controller=TabController(length:6,vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: devWidth,height:100,
                  child: FittedBox(
            alignment: Alignment.center,
            fit: BoxFit.fill,
                    child: DataTable(
            dataRowHeight: 20,
            headingRowHeight: 20,
                headingRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.grey[800]; // Use the default value.
                }),
                columns: [
              // which widget is this
              DataColumn(
                  label: Text(
                'Sno',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Horse',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )),
              DataColumn(
                  label: Text(
                'Horse no',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
              )),
            ],
                rows: List.generate(4, (index) => DataRow(
                  color: index==0||index==3?MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.yellow[900]; // Use the default value.
                }):index==1?MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.redAccent[700]; // Use the default value.
                }):MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered))
                    return Theme.of(context).colorScheme.primary.withOpacity(1);
                  return Colors.green[900]; // Use the default value.
                }),
                cells: [
                  DataCell(Text(
                    'Hurdle',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '63',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                  DataCell(Text(
                    '1',
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700]),
                  )),
                ],
              ))
              ,
            ),
          ),
        ),SizedBox(height:10),
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
            ),SizedBox(height:15),
            Container(
              height:70,width:double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Artboard 30.png',height:70,width:80),
                  Text('Race Name',
                  style:TextStyle(
                    color:Colors.blue[900],fontSize: 26,fontWeight: FontWeight.w500
                  )),
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
              height:30,width:double.infinity,
              color:Colors.white,
              child:TabBar(
                labelPadding:EdgeInsets.symmetric(horizontal:0) ,
                onTap: (_)=>setState(()=>controller.index=_),
                indicatorColor: Colors.blue[900],
                labelColor: Colors.blue[900],
                labelStyle: TextStyle(
                  fontSize:10
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize:10
                ),
                unselectedLabelColor: Colors.grey[700],
                controller: controller,
                tabs: [
                  Tab(text:'Card'),
                  Tab(text:'Predictor'),
                  Tab(text:'Draw'),
                  Tab(text:'Summary'),
                  Tab(text:'Track Record'),
                  Tab(text:'Print Out')
                ],
              )
            ),SizedBox(height:5),
            if(controller.index==0)CardTab(),
            if(controller.index==1)PredictorTab(),
            if(controller.index==2)DrawTab(),
            if(controller.index==3)SummaryTab(),
            if(controller.index==4)TrackRecordScreen()
      ],
    );
  }
}