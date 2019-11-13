
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './main.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return
     Builder(
       builder: (context) =>
             Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
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
                onPressed: (){signUp();},
                child: Text('sign up'),
              )
            ],
          ),
        ),
    ),
     );
  }


Future<void> signUp() async{
  final formState = _formKey.currentState;
  if(formState.validate()){
    formState.save();
    try{FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
    
    print('${user.email}');
    
    
    Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> MyApp(user: user,)
              ));
}catch(e){
  print(e.message);
}

  }
  
}
}