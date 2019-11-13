import 'package:animate/main.dart';
import 'package:animate/signin.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    
    return 
    
      
           FutureBuilder<FirebaseUser>(
              future: FirebaseAuth.instance.currentUser(),
              builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot){
                         if (snapshot.hasData){
                             FirebaseUser user = snapshot.data;
                             print('$user'); // this is your user instance
                             /// is because there is user already logged
                             return MyApp(user: user);
                          }
                           /// other way there is no user logged.
                           return SignInHelp();
               }
            
    );
  }
}