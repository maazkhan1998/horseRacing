import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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
            CustomStaticWidget.formWidget(context),SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              width:double.infinity,height:ScreenUtil().setHeight(40),
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: ()=>Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios,color:Colors.white,size:16),
                  ),
                  Text('New Castle',style:TextStyle(
                    color: Colors.white,fontSize:ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                  )),
                  Text('19-11-200',style:TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),SizedBox(height:ScreenUtil().setHeight(10)),
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
                  padding: EdgeInsets.symmetric(horizontal:ScreenUtil().setWidth(5)),
                                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(5),
                    ),
                    key: dataKeyList[index],
                    height: ScreenUtil().setHeight(50),
                    width: ScreenUtil().setWidth(50),
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height:ScreenUtil().setHeight(35),width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                            color:selectedIndex == index ? Colors.red : Colors.green,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),topRight: Radius.circular(5),
                            )
                          ),
                          child:Text(index.toString(),style: TextStyle(
                            color:Colors.white,fontSize: ScreenUtil().setSp(20,allowFontScalingSelf: true),fontWeight:FontWeight.bold
                          ),)
                        ),
                        Container(
                          alignment: Alignment.center,
                          height:ScreenUtil().setHeight(15),width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                            color:Colors.black87,
                            borderRadius: BorderRadius.only(
                              bottomLeft:Radius.circular(5),bottomRight: Radius.circular(5),
                            )
                          ),
                          child:Text('20:15',style: TextStyle(
                            color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight:FontWeight.bold
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
            SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              height:ScreenUtil().setHeight(30),width:double.infinity,
              child: Row(
                children: [
                  Container(
                    height:ScreenUtil().setHeight(30),width:ScreenUtil().setWidth(411/3),
                    color:Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text('TB (Horse Kind)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:Colors.white,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight:FontWeight.bold
                  ),),
                  ),
                  Container(
                    height:ScreenUtil().setHeight(30),width:ScreenUtil().setWidth(411/3),
                    color:Colors.white,
                    alignment: Alignment.center,
                    child: Text('Race Kind',
                    style: TextStyle(
                    color:Colors.black,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight:FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                  ),
                  Container(
                    height:ScreenUtil().setHeight(30),width:ScreenUtil().setWidth(411/3),
                    color:Colors.blue[900],
                    alignment: Alignment.center,
                    child: Text('Race Type',
                    style: TextStyle(
                    color:Colors.white,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight:FontWeight.bold
                  ),
                  textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),SizedBox(height:ScreenUtil().setHeight(10)),
            Container(
              height:ScreenUtil().setHeight(80),width:double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Artboard 30.png',height:ScreenUtil().setHeight(70),width:ScreenUtil().setWidth(80)),
                  Text('Race Name',
                  style:TextStyle(
                    color:Colors.blue[900],fontSize: ScreenUtil().setSp(26,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                  )),
                  CircularPercentIndicator(
                    percent: 0.7,
                    backgroundColor: Colors.red,
                    radius: 49,
                    center: Text('1900 dar',
                    style: TextStyle(
                      fontSize:ScreenUtil().setSp(9,allowFontScalingSelf: true),color:Colors.grey,fontWeight: FontWeight.w500
                    ),
                  ),
                  progressColor: Colors.green,
                  footer: Text('Finish Line',
                  style:TextStyle(
                    color:Colors.green,fontWeight:FontWeight.bold,fontSize: ScreenUtil().setSp(14)
                  )),
                  )],
              ),
            ),
            SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              height:ScreenUtil().setHeight(20),width:double.infinity,
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Price',style:TextStyle(
                    color:Colors.white,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                  )),
                  Container(
                    alignment: Alignment.center,
                    height:ScreenUtil().setHeight(15),width:ScreenUtil().setWidth(15),
                    decoration: BoxDecoration(
                      color:Colors.white,borderRadius:BorderRadius.circular(2)
                    ),
                    child:Icon(Icons.remove,color:Colors.black87,size:14)
                  )
                ],
              )
            ),SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              alignment: Alignment.center,
              height:ScreenUtil().setHeight(55),width:ScreenUtil().setWidth(411),
              padding: EdgeInsets.symmetric(
                horizontal:ScreenUtil().setWidth(15),vertical:5
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
                        text:'${index+1}',style: TextStyle(color:Colors.blue[900],fontSize:ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight: FontWeight.bold)
                      ),
                      TextSpan(
                        text:' AED 46,500;',style: TextStyle(color:Colors.grey[700],fontSize:ScreenUtil().setSp(14,allowFontScalingSelf: true),fontWeight: FontWeight.bold)
                      )
                    ]
                  ),
                )),
              )
            ),
            Container(
              height:ScreenUtil().setHeight(20),width:double.infinity,
              color:Colors.blue[900],
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Race Description',style:TextStyle(
                    color:Colors.white,fontSize:ScreenUtil().setSp(12,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                  )),
                  Container(
                    alignment: Alignment.center,
                    height:ScreenUtil().setHeight(15),width:ScreenUtil().setWidth(15),
                    decoration: BoxDecoration(
                      color:Colors.white,borderRadius:BorderRadius.circular(2)
                    ),
                    child:Icon(Icons.add,color:Colors.black87,size:14)
                  )
                ],
              )
            ),SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              height:ScreenUtil().setHeight(30),width:double.infinity,
              color:Colors.white,
              child:TabBar(
                labelPadding:EdgeInsets.symmetric(horizontal:0) ,
                onTap: (_)=>setState(()=>controller.index=_),
                indicatorColor: Colors.blue[900],
                labelColor: Colors.blue[900],
                labelStyle: TextStyle(
                  fontSize:ScreenUtil().setSp(10,allowFontScalingSelf: true)
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize:ScreenUtil().setSp(10,allowFontScalingSelf: true)
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
            ),SizedBox(height:ScreenUtil().setHeight(5)),
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