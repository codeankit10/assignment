import 'package:assignment/otp.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget{
  @override
  loginstate createState() =>loginstate();
}
class loginstate extends State<login> {
TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 160),
                    child: Center(
                      child: Text(
                        'Please enter your mobile number',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 20
                        ),
                      ),
                    ),

                  ),
                  Column(
                    children:[
                      Container(
                        margin:EdgeInsets.only(top: 40,right: 10,left: 10),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Mobile Number',
                            prefix: Padding(
                              padding: EdgeInsets.all(4),
                              child: Text('+91'),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,

                              )
                            )
                          ),

                          maxLength: 10,
                          keyboardType: TextInputType.number,
                          controller: textEditingController,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        child: FlatButton(
                          minWidth: double.infinity,
                          color: Color(0xFF251E51),
                          height: 60,
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context)=> otp(textEditingController.text)
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

                  )
                ],
              )
            ],
          )



    );
  }
}