import 'package:flutter/material.dart';

class MeetingTab extends StatefulWidget {
  @override
  _MeetingTabState createState() => _MeetingTabState();
}

class _MeetingTabState extends State<MeetingTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                        border:Border.all(
                          width: 2,color:Colors.grey,
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
                        border:Border.all(
                          width: 2,color:Colors.grey,
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
              ),SizedBox(height:15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],borderRadius:BorderRadius.circular(25)
                ),
                child: Column(
                                  children:[ Container(
                    width: double.infinity,height:150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),topRight: Radius.circular(20)
                      ),image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/Artboard 14.png')
                      )
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.symmetric(
                      horizontal:10,vertical:20,
                    ),
                    child: Text('Davis Fellas : Race Review of Happy Valley - 8th Novemeber 2020',
                    style:TextStyle(
                      color:Colors.blue,fontSize:16,fontWeight: FontWeight.bold
                    )),
                  )
                                  ]
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}