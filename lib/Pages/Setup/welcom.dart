import 'package:firebase_connection/Pages/Setup/signIn.dart';
import 'package:firebase_connection/Pages/Setup/signup.dart';

import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Shop App'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
         RaisedButton(
                 onPressed: navigateToSignIn,
                  child: Text('Sign in'),
               
                 
                ),
                 RaisedButton(
                  onPressed:navigateTOSignUp,
                  child: Text('Sign up'),
                 
                ),
             
      ],),
    );
  }

  void navigateToSignIn(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
  void navigateTOSignUp(){

 Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
  }

}