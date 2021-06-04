import 'package:flutter/material.dart';

void main(){runApp(MyApp());}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListWheelScrollView(
          itemExtent: 320,
          children: [
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
            Image.network('https://images.pexels.com/photos/1954048/pexels-photo-1954048.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
           ],
          //useMagnifier: true,
         // magnification: 0.5,
        ),
      ),
    );
  }
}