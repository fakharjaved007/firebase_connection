import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_connection/Pages/Setup/signIn.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
 String _email,_password;
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    
    body:Form(
      //implement key
       key: _formKey,
      child: Column(
        children: <Widget>[
               TextFormField(
                 validator: (input){
                   if(input.isEmpty){
                     return 'please type email';}},
                 onSaved: (input) => _email=input,
                 decoration: (
                   InputDecoration(labelText: 'email')
                 ),),
                 TextFormField(
                 validator: (input){
                   if(input.isEmpty){
                     return 'please type password';}},
                 onSaved: (input) => _password=input,
                 decoration: (
                   InputDecoration(labelText: 'password')
                 ),
                 obscureText: true,
                ),

                RaisedButton(
                  onPressed:(){
                    signUp();
                  },
                  child: Text('Sign Up'),
                 
                )
        ],
      ),
    )
    );
  }

  Future<void> signUp() async {
   final formState=_formKey.currentState;
   if(formState.validate()){
     formState.save();
     try{
    FirebaseUser user=await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email,password: _password);
    user.sendEmailVerification();
    //display user that we sent an email.
    Navigator.of(context).pop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
 
     }
     catch(e){
         print(e.toString());
         print("$_password $_email");
     }
    
   }
   
  }
}