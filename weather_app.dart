/*
  need to add these dependencies to pubspec.yaml file
  font_awesome_flutter: ^8.11.0
  
  http: ^0.12.2

*/



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main()=>runApp(
  MaterialApp(
    title: "Weather App",
    home:Home(),
  )
);

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var temp;
  var description;
  var windspeed;
  var humidity;
  var currently;

  Future getWeather() async{
    //i use open weather API 
    // on your API check if it F/C (Fahrenheit/Celsius) to get the known degree weather for you
    http.Response response=await http.get("#######your API######");
    var results=jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humidity=results['main']['humidity'];
      this.windspeed=results['wind']['speed'];
    });
  }

// called the getWeather method at first
  @override
  void initState(){
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height/3,
            width: MediaQuery.of(context).size.width,
            color: Colors.red,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    "currently in location",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  temp!=null? temp.toString()+"\u00B0":"loading",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                  currently!=null? currently.toString():"loading",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding:EdgeInsets.all(20.0),
              child:ListView(
                children: <Widget>[
                  ListTile(
                   leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                    title: Text("tempreture"),
                    trailing: Text(
                      temp!=null? temp.toString()+"\u00B0":"loading",
                    ),
                  ),
                  ListTile(
                   leading: FaIcon(FontAwesomeIcons.cloud),
                    title: Text("weather"),
                    trailing: Text(
                      description!=null? description.toString():"loading",
                    ),
                  ),
                  ListTile(
                   leading: FaIcon(FontAwesomeIcons.sun),
                    title: Text("humidity"),
                    trailing: Text(
                      humidity!=null? humidity.toString():"loading",
                    ),
                  ),
                  ListTile(
                   leading: FaIcon(FontAwesomeIcons.wind),
                    title: Text("wind speed"),
                    trailing:Text(
                      windspeed!=null? windspeed.toString():"loading",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
