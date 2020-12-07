import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:mks_racing/widgets/landingPage/competitionScreen/superFectaTabBar.dart';

class InnerCompetitionScreen extends StatefulWidget {
  @override
  _InnerCompetitionScreenState createState() => _InnerCompetitionScreenState();
}

class _InnerCompetitionScreenState extends State<InnerCompetitionScreen> with SingleTickerProviderStateMixin {

  TabController controller;

  initState(){
    controller=TabController(length:3,vsync: this);
    super.initState();
  }

  int selectedIndex = 0;
  int totalvalues = 10;
  var dataKeyList = List.generate(10, (index) => GlobalKey());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:ScreenUtil().setHeight(5)),
            Container(
              height:ScreenUtil().setHeight(40),width:double.infinity,
              padding: EdgeInsets.symmetric(horizontal:10),
              color: Colors.blue[900],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios,color:Colors.white,size:18),
                  Text('NewCastle',style: TextStyle(
                    color:Colors.white,fontSize: ScreenUtil().setSp(16,allowFontScalingSelf: true),fontWeight: FontWeight.w500
                  ),),
                  Text('19-11-200',style: TextStyle(
                    color:Colors.white,fontSize: ScreenUtil().setSp(12,allowFontScalingSelf: true),
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
                  padding: EdgeInsets.symmetric(horizontal:5),
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
    ),SizedBox(height:ScreenUtil().setHeight(10)),
    Container(
      height:ScreenUtil().setHeight(30),width:double.infinity,
      color:Colors.white,
      child: TabBar(
        onTap: (_)=>setState(()=>controller.index=_),
        indicatorColor: Colors.blue[900],
        indicatorWeight: 4,
        labelColor: Colors.blue[900],
        unselectedLabelColor: Colors.grey,
        controller: controller,
        tabs: [
          Tab(text:'Pick Six'),
          Tab(text: 'Tri Cast',),
          Tab(text: 'Super Fecta',)
        ],
      ),
    ),
    if(controller.index==2)SuperFectaTabBar()
          ],
        )
      ),
    );
  }
}