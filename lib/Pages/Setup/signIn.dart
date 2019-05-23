import 'package:firebase_connection/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main()=>runApp(LoginPage());
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                 
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.orange)),
                                ),
                 ),
                 TextFormField(
                   
                 validator: (input){
                   if(input.isEmpty){
                     return 'please type password';}},
                 onSaved: (input) => _password=input,
                 decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange),
                            
                            )),
                 obscureText: true,
                ),

                RaisedButton(
                  onPressed:(){
                    signIn();
                  },
                  child: Text('Sign in'),
                 
                )
        ],
      ),
    )
    );
  }

  Future<void> signIn() async {
   final formState=_formKey.currentState;
   if(formState.validate()){
     formState.save();
     try{
    FirebaseUser user=await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email,password: _password);
         Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user: user)));
 
     }
     catch(e){
         print(e.toString());
         print("$_password $_email");
     }
    
   }
   
  }
}
