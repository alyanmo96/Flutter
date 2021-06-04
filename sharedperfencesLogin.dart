import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedperfencesLogin/MyHomePage.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CheckLogin(),
    );
  }
}

class CheckLogin extends StatefulWidget {
  @override
  _CheckLoginState createState() => _CheckLoginState();
}

class _CheckLoginState extends State<CheckLogin> {
  
  // ignore: non_constant_identifier_names
  final email_address = TextEditingController();
  final password = TextEditingController();
  
  SharedPreferences sharedPreferences;
  bool isANewUser;

  @override
  void initState(){
    super.initState();
    check_if_already_login_method();
  }

  // ignore: non_constant_identifier_names
  void check_if_already_login_method()async{
    sharedPreferences = await SharedPreferences.getInstance();
    isANewUser = (sharedPreferences.getBool('isLogin') ?? true);
    if(isANewUser==false){//yes login
      Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context)=>Dashboard())
      );
    }
  }
  @override
  void dispose(){
    email_address.dispose();
    password.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Keep login'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: email_address,
                  decoration: InputDecoration(
                    labelText: 'email'
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: 'password'
                  ),
                ),
              ),
              RaisedButton(
                onPressed:(){
                  String email = email_address.text;
                  String pass = password.text;
                  if(email!=''&&pass!=''){
                    sharedPreferences.setBool('isLogin',false);
                    sharedPreferences.setString('Email',email);
                    Navigator.pushReplacement(
                      context, new MaterialPageRoute(builder: (context)=>Dashboard())
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}