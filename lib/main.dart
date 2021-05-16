import 'package:assignment/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  myappstate createState() => myappstate();
}

class myappstate extends State<MyApp> {
  String value;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
      Column(
      children: [
      Container(

      margin: EdgeInsets.only(top: 160),
      child: Center(
        child: Text(
          'Please select your Language',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20
          ),
        ),
      ),

    ),
        Container(
          width: 140,

          margin: EdgeInsets.only(top: 10),
          child: Center(
            child: Text(
              'You can change the language at any time',
              style: TextStyle(
                   fontSize: 14,color: Colors.grey
              ),
            ),
          ),

        ),
    Column(
    children:[

    Container(
width: 250,
    margin:EdgeInsets.only(top: 40,right: 10,left: 10),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),

    ),
    child: DropdownButton<String>(


    value: value,
   // elevation: 16,
    items: <String>[
    'English','Hindi'
    ].map<DropdownMenuItem<String>>((String value){
    return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
    );
    }).toList(),
    onChanged: (String newValue){
    setState(() {
    value =newValue;
    });
    }

    )

    ),

      Container(
        width: 250,
        margin: EdgeInsets.all(10),
        child: FlatButton(
          minWidth: double.infinity,
          color: Color(0xFF251E51),
          height: 60,
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context)=> login()
            ));
          },
          child: Text(
            'CONTINUE',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,

            ),

          ),
        ),
      )
    ],

    ),




    ],

    )
    ],
    )
    ,
    );


  }
}



