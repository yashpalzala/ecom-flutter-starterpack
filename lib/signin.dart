
import 'package:animate/yoyo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './signup.dart';
class SignInHelp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SignIn()
    );
  }
}


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text('Sign In'),
          ),
          body: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input){
                    return;
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    labelText: 'Email'
                  ),
                ),
                TextFormField(
                  validator: (input) {
                    return;
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(
                    labelText: 'password'
                  ),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: (){signIn();},
                  child: Text('sign in'),
                ),
                RaisedButton(
                  onPressed: (){
                    Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> SignUp()
              ));
                  },
                  child: Text('sign up'),
                )
              ],
            ),
          ),
    );
    
  }


Future<void> signIn() async{
  final formState = _formKey.currentState;
  if(formState.validate()){
    formState.save();
    try{FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
    
    print('${user.email}');
    
    
    Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> RootPage()
              ));
}catch(e){
  print(e.message);
}

  }
  
}
}











/* import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';


import './signup.dart';
import './main.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (input) {
                    return;
                  },
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  validator: (input) {
                    return;
                  },
                  onSaved: (input) => _password = input,
                  decoration: InputDecoration(labelText: 'password'),
                  obscureText: true,
                ),
                RaisedButton(
                  onPressed: () {
                    signIn();
                  },
                  child: Text('sign in'),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text('sign up'),
                ),
                RaisedButton (
                  onPressed: () {
                    check();
                  },
                  child: Text('check'),
                ),
                RaisedButton (
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text('logout'),
                )
              ],
          ),
        ),
      ),
           
    );
  }



  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        print('${user.email}');
        
        
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => MyApp(user: user,)));
      } catch (e) {
        print(e.message);
      }
    }
  }
}

Future<void> check() async{
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  print('$user');
}
 */