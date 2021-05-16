import 'package:assignment/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class otp extends StatefulWidget{
  final String phone;

  otp(this.phone);

  @override
  otpstate createState() =>otpstate();
}
class otpstate extends State<otp> {
  final GlobalKey<ScaffoldState> key=GlobalKey<ScaffoldState>();
  String verificationCode;
  final TextEditingController _textEditingController=TextEditingController();
  final FocusNode focusNode=FocusNode();
  final BoxDecoration decoration=BoxDecoration(
    color: const Color(0xFF94D5E3),

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Verify Phone',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                      'Code is sent to ${widget.phone}'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: PinPut(
                  fieldsCount: 6,
                  eachFieldHeight: 55,
                  eachFieldWidth: 40,
                  focusNode: focusNode,
                  submittedFieldDecoration: decoration,
                  selectedFieldDecoration: decoration,
                  followingFieldDecoration: decoration,
                  controller: _textEditingController,
                    onSubmit: (pin) async{
                    try{
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential
                        (verificationId: verificationCode, smsCode: pin))
                          .then((value) async {
                        if(value.user!=null){
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context)=>home()), (route) => false);
                        }

                      });
                    }
                    catch(e){
                      FocusScope.of(context).unfocus();
                        key.currentState
                      .showSnackBar(SnackBar(content: Text('invalid otp')));

                    }
                  },
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
                        builder: (context)=> home()
                    ));
                  },
                  child: Text(
                    'VERIFY AND CONTINUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),

                  ),
                ),
              )
            ],
          )

    );

  }
verifyPhone() async{
    await FirebaseAuth.instance.verifyPhoneNumber
      (phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async{
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async{
        if(value.user!=null){
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (context)=>home()), (route) => true);
        }
      });
        },
        verificationFailed: (FirebaseAuthException e){
      print(e);
        },

        codeSent: (String ID,int resend){
      setState(() {
        verificationCode=ID;
      });
        },

        codeAutoRetrievalTimeout: (String verification){
      setState(() {
        verificationCode=verification;
      });
        },
      timeout: Duration(seconds: 120)
        );
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyPhone();
  }
}