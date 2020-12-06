import 'package:flutter/material.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/cardTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/drawTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/predictorTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/summaryTab.dart';
import 'package:mks_racing/widgets/landingPage/racingScreen/trackRecordTab.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../main.dart';

class RaceScreen extends StatefulWidget {
  @override
  _RaceScreenState createState() => _RaceScreenState();
}

class _RaceScreenState extends State<RaceScreen> with SingleTickerProviderStateMixin{

  int selectedIndex = 0;
  int totalvalues = 10;
  var dataKeyList = List.generate(10, (index) => GlobalKey());

  @override
  void initState() { 
    controller=TabController(length: 6,vsync: this);
    super.initState();
    
  }

  TabController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize:MainAxisSize.min,
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
        ),
      ),
    );
  }
}