import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  final String profilePageImgLink='https://images.pexels.com/photos/2853542/pexels-photo-2853542.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940';
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  _showDialog(BuildContext context,String path,){
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Text(''),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child:Image.network(path),
      ),        
      actions: [
        CupertinoDialogAction(
          child: Text('Exit'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Center(
        child: Card(
          color: Colors.black,
          child: Column(
            children: [
              Card(
                color: Colors.black45,
                child: Center(
                  child: RaisedButton(
                    color: Colors.black45,
                    child: ClipRRect(          
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.network(widget.profilePageImgLink,height: 120,),
                    ),
                    onPressed:()=> _showDialog(context,widget.profilePageImgLink,),
                  ),
                ),
              ),
              SizedBox(height: 32,),
              Center(
                child: Container(
                  height: 550.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),   
                    child: Stack(
                      children: <Widget>[
                        Image.network(
                          'https://images.pexels.com/photos/2647091/pexels-photo-2647091.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          fit: BoxFit.cover,
                      ),
                      Positionedd(top: 5,comment: 'This Is The First Comment, please check other comments', path:'https://images.pexels.com/photos/2253707/pexels-photo-2253707.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',color:Colors.pink.shade100,),
                      Positionedd(top: 70,comment: 'يا ريتك تطلعي وتدعسي عقبري دعس....ولك دخيل عالله ألي خلقك شو هالجمال. مش هيذ برضوا أشي ومنه. إرحموا من في الأرض يرحمكم من في السما',path: 'https://images.pexels.com/photos/2045534/pexels-photo-2045534.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',color:Colors.white,),
                      Positionedd(top: 235,comment: 'איזה יפה את',path:'https://images.pexels.com/photos/3687506/pexels-photo-3687506.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260' ,color:Colors.orangeAccent.shade700,),
                      Positionedd(top: 400,comment: 'While it may not be obvious to everyone, there are a number of reasons creating random paragraphs can be useful. A few examples of how some people use this generator are listed in the following paragraphs.',path:'https://images.pexels.com/photos/3034903/pexels-photo-3034903.jpeg?auto=compress&cs=tinysrgb&h=650&w=940' ,color:Colors.tealAccent,),
                      Positionedd(top: 480,comment: 'This Is The Last Comment, please check other comments',path:'https://images.pexels.com/photos/2125358/pexels-photo-2125358.jpeg?auto=compress&cs=tinysrgb&h=650&w=940' ,color:Colors.lightGreenAccent,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}

class Positionedd extends StatefulWidget{
  final double top;
  final String comment, path;
  final Color color;
  const Positionedd({Key key, this.top, this.comment, this.path,this.color}) : super(key: key);
  @override
  _PositioneddState createState() => _PositioneddState();
}

class _PositioneddState extends State<Positionedd> {
  _showDialog(BuildContext context,String path, String comment){
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      title: Column(
        children: [
          Text(
            comment,
            // style: TextStyle(color: widget.color),
          ),
          Icon(
            Icons.translate_sharp,
            color: Colors.black87,
          ),
        ],
      ),
      content: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child:Image.network(path,),
      ),        
      actions: [
        CupertinoDialogAction(
          child: Icon(Icons.close_fullscreen_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    return showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
  return Positioned(
      top: widget.top,
      left: 0,
      right: 0,
      child: RaisedButton(
        color: Colors.transparent,
        child: Center(
          child: buildBlur(
            borderRadius: BorderRadius.circular(20),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(160.0),
                  child:Image.network(widget.path,height: 60,width: 60,),
                ),
                Flexible(
                  child: RichText(
                    overflow: TextOverflow.ellipsis,
                    strutStyle: StrutStyle(fontSize: 12.0),
                    text: TextSpan(
                        style: TextStyle(color: widget.color),
                        text: widget.comment),
                  ),
                ),
              ],
            ),
          ),
        ),
      onPressed:()=> _showDialog(context,widget.path,widget.comment),
      ),
    );    
 }
   Widget buildBlur({
    @required Widget child,
    BorderRadius borderRadius,
    double sigmaX = 10,
    double sigmaY = 20,
  }) =>
      ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.zero,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
          child: child,
        ),
      );
}