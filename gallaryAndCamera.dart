import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: 'camera and gallay app',
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File imageFile;

  _openCamera(BuildContext context)async{
    // ignore: deprecated_member_use
    var picture=await ImagePicker.pickImage(source:ImageSource.camera);
    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }
  _openGallary(BuildContext context)async{
    // ignore: deprecated_member_use
    var picture=await ImagePicker.pickImage(source:ImageSource.gallery);
    this.setState(() {
      imageFile=picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("choose!"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text("gallary"),
                  onTap:(){
                    _openGallary(context);
                  },
                ),
                GestureDetector(
                  child: Text("camera"),
                  onTap:(){
                    _openCamera(context);
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  }

  Widget _decideImageView(){
    if(imageFile==null){
        return Text("no image yet");
    }else{
     return Image.file(imageFile, height: 400,width: 400,);
      //return Text('yes ther is an image');
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("main screen"),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _decideImageView(),
                RaisedButton(
                  onPressed: (){
                    _showChoiceDialog(context);                    
                  },child: Text("Image selected"),
                )
              ],
            ),
          ),
        ),
    );
  }
}