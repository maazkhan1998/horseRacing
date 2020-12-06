import 'package:flutter/material.dart';
import 'package:mks_racing/screens/competitionScreens/innerCompetitionScreen.dart';
import 'package:mks_racing/widgets/custom.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CompetitionScreen extends StatefulWidget {
  @override
  _CompetitionScreenState createState() => _CompetitionScreenState();
}

class _CompetitionScreenState extends State<CompetitionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:5),
            ListTile(
              onTap: ()=>pushNewScreen(
                context,
                screen: InnerCompetitionScreen()
              ),
          tileColor: Colors.white,
          leading: Text('Pick Six',
          style: TextStyle(
            color:Colors.black54,fontSize: 18,fontWeight:FontWeight.bold
          ),),
          trailing: Container(
            height:30,width:30,color:Colors.blue[900],
            child: Center(
              child: Icon(Icons.add,color:Colors.grey,size:30),
            ),
          ),
        ),SizedBox(height:10),
        ListTile(
          tileColor: Colors.white,
          leading: Text('Tri Cast',
          style: TextStyle(
            color:Colors.black54,fontSize: 18,fontWeight:FontWeight.bold
          ),),
          trailing: Container(
            height:30,width:30,color:Colors.blue[900],
            child: Center(
              child: Icon(Icons.remove,color:Colors.grey,size:30),
            ),
          ),
        ),SizedBox(height:5),
         Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 5,horizontal:10
          ),
          color:Colors.white,
          child: Column(
            children: [
              Container(width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal:15
                ),
                alignment: Alignment.center,
                height:50,decoration: BoxDecoration(
                  color: Colors.grey[300].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Newcastle',
                    style:TextStyle(
                      color:Colors.blue,fontWeight: FontWeight.bold,fontSize: 16
                    )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width:30,height:30,alignment: Alignment.center,
                        child: Text('F',
                        style: TextStyle(
                          color:Colors.grey,fontWeight:FontWeight.bold,fontSize:16
                        ),)),
                        Container(width:30,height:30,alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:Border.all(
                            width: 1,color:Colors.grey,
                          )
                        ),
                        child: Text('H',
                        style: TextStyle(
                          color:Colors.grey,fontWeight:FontWeight.bold,fontSize:16
                        ),)),SizedBox(width:10),
                        Text('2 m',
                        style:TextStyle(
                          color: Colors.blue,fontWeight: FontWeight.bold,fontSize:16
                        ))
                      ],
                    )
                  ],
                ),
                ),SizedBox(height:10),
              Container(width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal:15
                ),
                alignment: Alignment.center,
                height:50,decoration: BoxDecoration(
                  color: Colors.grey[300].withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Wolverhampton',
                    style:TextStyle(
                      color:Colors.blue,fontWeight: FontWeight.bold,fontSize: 16
                    )),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(width:30,height:30,alignment: Alignment.center,
                        child: Text('F',
                        style: TextStyle(
                          color:Colors.grey,fontWeight:FontWeight.bold,fontSize:16
                        ),)),
                        Container(width:30,height:30,alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:Border.all(
                            width: 1,color:Colors.grey,
                          )
                        ),
                        child: Text('H',
                        style: TextStyle(
                          color:Colors.grey,fontWeight:FontWeight.bold,fontSize:16
                        ),)),SizedBox(width:10),
                        Text('17 m',
                        style:TextStyle(
                          color: Colors.blue,fontWeight: FontWeight.bold,fontSize:16
                        ))
                      ],
                    )
                  ],
                ),
                )]))
          ],
        ),
      ),
    );
  }
}