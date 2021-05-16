import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class home extends StatefulWidget{
  @override
  homestate createState() =>homestate();
}
class homestate extends State<home> {
  String radio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children:<Widget>[
        Container(
margin: EdgeInsets.only(top:85,right: 10,left: 10),

            
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),

            ),
        child:
          RadioListTile(value: 'Shipper',
              title: Row(
                children: <Widget>[
                  Expanded(
                      child: InkWell(
                        child: Icon(
                          Icons.home_outlined,
                          size: 50,
                        ),
                      )),
                  Expanded(
                    flex: 3,
                      child:Column(
                          children:<Widget>[
                            Text(
                              'Shipper',
                              overflow: TextOverflow.ellipsis,

                            ),
                            Text(
                              'Enter some of the data',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                color:Colors.grey
                              ),
                            ),
                          ]
                      )             )
                ],
              ),
              groupValue: radio, onChanged: (val){
            setState(() {
              radio=val;
            });
          })),
    Container(
    margin: EdgeInsets.only(top:15,right: 10,left: 10),
    

    decoration: BoxDecoration(
    border: Border.all(color: Colors.grey)),

    child:
    RadioListTile(value: 'Transporter',
    title: Row(
    children: <Widget>[
    Expanded(
    child: InkWell(
    child: Icon(
    Icons.local_shipping_outlined,
    size: 50,
    ),
    )),
    Expanded(
    flex: 3,
    child:Column(
    children:<Widget>[
    Text(
    'Transporter',
    overflow: TextOverflow.ellipsis,

    ),
      Text(
        'Enter some of the data',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: 15,
            color:Colors.grey
        ),
      ),    ]
    )

    )
    ],
    ),
    groupValue: radio, onChanged: (val){
    setState(() {
    radio=val;
    });
    })
    )]),

    );


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
}