import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedperfencesLogin/main.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  SharedPreferences sharedPreferences;
  String email;

  @override
  void initState(){
    super.initState();
    initial_method();
  }

  @override
  void initial_method()async{
    sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      email=sharedPreferences.getString('isLogin');      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Text(
              'Welcom $email'
            ),
            RaisedButton(
              onPressed: (){
                sharedPreferences.setBool('isLogin',true);
                Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => CheckLogin()));                
              },
              child: Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}