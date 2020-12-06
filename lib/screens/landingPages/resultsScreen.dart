import 'package:flutter/material.dart';
import 'package:mks_racing/widgets/custom.dart';

class ResultsScreen extends StatefulWidget {
  @override
  _ResultsScreenState createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomStaticWidget.apppBar(context),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            CustomStaticWidget.formWidget(context),SizedBox(height:5),
            ListTile(
          tileColor: Colors.white,
          leading: CircleAvatar(
            backgroundImage:AssetImage('assets/Artboard 12.png') ,
          ),
          title: Text('United Kingdom',
          style: TextStyle(
            color:Colors.black,fontSize: 18,fontWeight:FontWeight.bold
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
          leading: CircleAvatar(
            backgroundImage:AssetImage('assets/Artboard 12 copy.png') ,
          ),
          title: Text('England',
          style: TextStyle(
            color:Colors.black,fontSize: 18,fontWeight:FontWeight.bold
          ),),
          trailing: Container(
            height:30,width:30,color:Colors.blue[900],
            child: Center(
              child: Icon(Icons.remove,color:Colors.grey,size:30),
            ),
          ),
        ),SizedBox(height:10),
        ListView.separated(
          shrinkWrap: true,
          physics:ClampingScrollPhysics(),
          itemCount: 3,
          separatorBuilder: (context,index)=>SizedBox(height:5),
          itemBuilder: (context,index)=>
          Container(
            height:80,
            alignment: Alignment.center,
            color:Colors.white,padding: EdgeInsets.symmetric(vertical:5,horizontal:10),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1:15',
                style: TextStyle(
                  color:Colors.black54,fontSize:22,fontWeight:FontWeight.bold
                ),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1st   The Big Breakway 4/9f',
                    style: TextStyle(
                      color:Colors.black54,fontSize:16,fontWeight: FontWeight.w500
                    ),),
                    Text('2nd   Doc Penfro 12/1',
                    style: TextStyle(
                      color:Colors.black38,fontSize:16,fontWeight: FontWeight.w500
                    ),),
                    Text('3rd   The Butcher said 8/1',
                    style: TextStyle(
                      color:Colors.black38,fontSize:16,fontWeight: FontWeight.w500
                    ),)
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,color: Colors.grey[400],size:30
                )
              ],
            )
          ),
        )
          ],
        ),
      )
    );
  }
}