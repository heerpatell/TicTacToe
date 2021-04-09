import 'package:flutter/material.dart';
import 'package:tictactoe_app/StartingPage.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool onTurn =true;
  int oscore=0;int xscore=0;int filledbox=0,score; String winnername='';String loserName='';
  var myTextStyle=TextStyle(fontSize: 30,color: bgcolor);
  List<String> displayXO = ['','','','', '','','','','',''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor2,
      body:
      Column(
        children: [
            Container(
            height: 85,
            alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0,top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Start()));
                          msg1.clear();msg2.clear();
                        },
                        child: NavItem(icon: Icons.arrow_back_ios_outlined,)
                    ),

                    Text("Tic Tac Toe",style: TextStyle(
                      fontSize: 32.0,
                      color: bgcolor,
                      fontWeight: FontWeight.w400,
                    ),),
                    InkWell(
                        onTap: (){
                          _clearBoard();
                        },
                        child: NavItem(icon: Icons.refresh,)
                    ),
                  ],
                ),
              ),
          ),
          SizedBox(height:15),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index){
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color:bgcolor),
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],style: TextStyle(color: bgcolor,fontSize: 40),
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
          Column(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 40.0),
                  child: Text("Score board",style:TextStyle(color: dark1,fontSize: 30),),
                  decoration: BoxDecoration(
                      color: bgcolor,
                      boxShadow: [
                        BoxShadow(color:Colors.white30, offset: Offset(22,11), spreadRadius: 3, blurRadius: 27),
                        BoxShadow(color:Colors.black26, offset: Offset(-4,-7), spreadRadius: 3,blurRadius: 27),
                      ]
                  ),
                ),
              ),
              //  SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name1+"(0)",style:TextStyle(color: bgcolor,fontSize: 30)),
                        Text(oscore.toString(),style:TextStyle(color: bgcolor,fontSize: 30))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(name2+"(x)",style:TextStyle(color: bgcolor,fontSize: 30)),
                        Text(xscore.toString(),style:TextStyle(color: bgcolor,fontSize: 30))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
  void _tapped(int index){
    setState(() {
      if(onTurn && displayXO[index] == ''){
        displayXO[index] = '0';
        filledbox+=1;
      }else if(!onTurn && displayXO[index] == ''){
        displayXO[index] = 'x';
        filledbox+=1;
      }
      onTurn = !onTurn;
      _checkWinner();
    });
  }
  void _checkWinner(){
    if(displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != '' ){
      _showDialog(displayXO[0]);
    }
    if(displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != '' ){
      _showDialog(displayXO[3]);
    }
    if(displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != '' ){
      _showDialog(displayXO[6]);
    }
    if(displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != '' ){
      _showDialog(displayXO[0]);
    }
    if(displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != '' ){
      _showDialog(displayXO[1]);
    }
    if(displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != '' ){
      _showDialog(displayXO[2]);
    }
    if(displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != '' ){
      _showDialog(displayXO[0]);
    }
    if(displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != '' ){
      _showDialog(displayXO[2]);
    }
    else if(filledbox == 9){
      _throwDialog();
    }
  }
  void _showDialog(String winner){
    if(winner == '0'){
      oscore+=1;
      winnername=name1;
      loserName=name2;
    }else if(winner == 'x'){
      xscore+=1;
      winnername=name2;
      loserName=name1;
    }
    if(winner== '0'){
      score=oscore;
    }else if(winner == 'x'){
      score=xscore;
    }
    showDialog(
        barrierDismissible: false, //cant click outside of the box
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Color.fromRGBO(210,190,174,70),
            title: Text("Winner is : "+winnername +"\nScore of "+ winnername +" is : "+score.toString(),style: TextStyle(color: bgcolor2,fontSize: 25),),
            content: Text("Better luck next time, "+loserName+ " !",style: TextStyle(fontWeight: FontWeight.bold,color: bgcolor,fontSize: 23),),
            actions: [
              RaisedButton(
                padding: EdgeInsets.only(left: 15,right: 15),
                color: bgcolor2,
                  child: Text("Play again",style: TextStyle(color: bgcolor,fontSize: 20),),
                 onPressed: (){
                _clearBoard();
                Navigator.of(context).pop();
                 },
              ),
              RaisedButton(
                padding: EdgeInsets.only(left: 10,right: 15),
                color: bgcolor2,
                child: Text("Refrsh Score",style: TextStyle(color: bgcolor,fontSize: 20),),
                onPressed: (){
                  _clearBoard();
                  _refreshScore();
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
  }

  void _clearBoard(){
    setState(() {
      for(int i=0;i<9;i++) {
        displayXO[i]='';
      }
    });
    filledbox=0;
  }

  void _refreshScore(){
    setState(() {
      xscore=0;
      oscore=0;
    });
  }

  void _throwDialog(){
    showDialog(
        barrierDismissible: false, //cant click outside of the box
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: Color.fromRGBO(210,190,174,70),
            title: Text("Draw !!",style: TextStyle(color: bgcolor2,fontSize: 20),),
            content: Text("Oops!! Try again "+name1+" and  "+name2,style: TextStyle(color: bgcolor,fontSize: 20),),
            actions: [
              FlatButton(
                color: bgcolor2,
                onPressed:(){
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Text("Play again",style: TextStyle(color: bgcolor,fontSize: 20),),
              ),
            ],
          );
        }
    );
  }
}

class NavItem extends StatelessWidget {
  @override
  final IconData icon;
  const NavItem({Key key, this.icon}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 50,width: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color:Colors.white60.withOpacity(0.3),
            offset: Offset(4,11),
            spreadRadius: 3,
            blurRadius: 10,
          ),
          BoxShadow(
            color:Colors.black26.withOpacity(0.3),
            offset: Offset(-4,-7),
            spreadRadius: 3,
            blurRadius: 10,
          ),
        ],
        color: bgcolor,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Icon(icon,color: dark1,),
    );
  }
}
