import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe_app/HomePage.dart';

Color bgcolor=Color.fromRGBO(81,80,112,30);
Color dark1=Color.fromRGBO(255,159,131,100);
Color bgcolor2=Color.fromRGBO(255,205,174,30);
class Starting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Start(),
    );
  }
}
class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}
String name1="";String name2=""; bool validate1=false,validate2=false; final msg1=TextEditingController(),msg2 =TextEditingController();
class _StartState extends State<Start> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Builder(
        builder: (context) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("image/backGround.png"),
                alignment:Alignment.topCenter,
                fit: BoxFit.cover,
                scale: 500,
              ),
            ),
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Center(child: Text(" TIC TAC TOE",style: TextStyle(fontSize: 30,color: dark1,fontWeight: FontWeight.w500),)),
                      height: 70,width: 230,
                      decoration: BoxDecoration(
                        color: bgcolor,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow:[
                          BoxShadow(color:Colors.white30, offset: Offset(22,11), spreadRadius: 3, blurRadius: 27),
                          BoxShadow(color:Colors.black26, offset: Offset(-4,-7), spreadRadius: 3,blurRadius: 27),
                        ],
                      ),
                    ),

                    SizedBox(height: 15),
                    Container(
                      child: Text(" 2 players Game",style: TextStyle(fontSize: 30,color: bgcolor,fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 40),

                      Container(
                        margin: EdgeInsets.all(20),
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          controller: msg1,
                          decoration: InputDecoration(
                            hintText: "Player1 name",
                            labelText: "0 player",
                            border: OutlineInputBorder(
                              borderRadius:  BorderRadius.all(Radius.circular(20.0)),
                              borderSide: BorderSide(color: bgcolor, width: 10),
                            ),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: bgcolor),borderRadius:BorderRadius.all(Radius.circular(20.0) )),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius:BorderRadius.all(Radius.circular(20.0))),
                            labelStyle:TextStyle(
                              color: bgcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            hintStyle: TextStyle(
                              color: bgcolor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          autofocus: false,
                          onChanged: (text){
                            name1=text;
                          },
                        ),
                      ),


                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: TextFormField(
                        controller: msg2,
                        decoration: InputDecoration(
                          hintText: "Player2 name",
                          labelText: "X player",
                          border: OutlineInputBorder(
                            borderRadius:  BorderRadius.all(Radius.circular(20.0)),
                          ),
                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: bgcolor),borderRadius:BorderRadius.all(Radius.circular(20.0) )),
                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue),borderRadius:BorderRadius.all(Radius.circular(20.0))),
                          labelStyle:TextStyle(
                            color: bgcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          hintStyle: TextStyle(
                            color: bgcolor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        autofocus: false,
                        onChanged: (text){
                          name2=text;
                        },
                      ),
                    ),

                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 110),
                        child: Text("Play Game",style: TextStyle(fontSize: 30.0,color: dark1,fontWeight: FontWeight.w700),),
                        decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow:[
                            BoxShadow(color:Colors.white60, offset: Offset(19,8), spreadRadius: 3, blurRadius: 27),
                            BoxShadow(color:Colors.black38, offset: Offset(-4,-7), spreadRadius: 3,blurRadius: 27),
                          ],
                        ),
                      ),
                      onTap: (){
                        setState(() {
                          msg1.text.isEmpty ? validate1 = false : validate1 = true;
                          msg2.text.isEmpty ?  validate2 = false: validate2 = true;
                        });
                        if(validate1 && validate2){
                          print("Clicked on play button");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        }else{
                          print("clicked play buttton");
                          SnackBar mysnackbar = SnackBar(
                            padding: EdgeInsets.only(left: 50),
                            content: Text('Enter Name Field, Please!',style: TextStyle(color: dark1,fontSize: 25,fontWeight: FontWeight.w500,wordSpacing: 3),),
                            duration: Duration(seconds: 1),
                            backgroundColor: bgcolor,

                          );
                          Scaffold.of(context).showSnackBar(mysnackbar);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

