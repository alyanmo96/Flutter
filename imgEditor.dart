import 'dart:typed_data';
import 'package:ImgEdit/filter.dart';
import 'package:ImgEdit/second_screen.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final GlobalKey _globalKey = GlobalKey();

  final List<List<double>> filters = [
    SEPIUM, YellowSEPIUM , WihteYellowSEPIUM,
    WihteAndYellowBackGroundYellowSEPIUM,
    LittelBlue,FullBlue,WihteBackGroundAndSidesYellowSEPIUM];

  void convertWidgetToImage() async {
    RenderRepaintBoundary repaintBoundary = _globalKey.currentContext.findRenderObject();
    ui.Image boxImage = await repaintBoundary.toImage(pixelRatio: 1);
    ByteData byteData = await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uint8list = byteData.buffer.asUint8List();
    Navigator.of(_globalKey.currentContext).push(MaterialPageRoute(
        builder: (context) => SecondScreen(
              imageData: uint8list,
        )));
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Filter"),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions:[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: convertWidgetToImage,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: RepaintBoundary(
        key: _globalKey,
        child: Center(
          child: Container(
            constraints: BoxConstraints(
                maxWidth: size.width,
                maxHeight: size.width,
            ),
            child: PageView.builder(
              itemCount: filters.length,
              itemBuilder: (context,index){
              return ColorFiltered(
                colorFilter: ColorFilter.matrix(filters[index]),
                child: Image.asset(
                  "assets/img.jpeg",
                  width: size.width,
                  fit:BoxFit.cover,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}