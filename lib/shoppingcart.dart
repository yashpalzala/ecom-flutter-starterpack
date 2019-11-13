
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Cart extends StatefulWidget{
  final user;
    
    Cart({this.user});
    
   
  @override
  State<StatefulWidget> createState() {
    
    return CartState();
  }

}

class CartState extends State<Cart>{
 

  /* final db = Firestore.instance.collection('mTBJyL75BkakA7pK4gDSK3ZkFpk2').document('-LkdqKv6d_OWWzDgOgdN');
  String title ; int price;
void readData() async {
  
   db.get().then((datasnapshots){
       setState(() {
          if(datasnapshots.exists){
         title =  datasnapshots.data['title'];
         price = datasnapshots.data['price'];
        print(title + '$price');
       
      }
       });
     
      
    });
    
    
    print('whatup!!!');
  }
  
  @override
  void initState() {
    readData();
    super.initState();
  } */
  
  

  
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Padding(
        padding: EdgeInsets.all(0),
        child: StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(widget.user.uid).snapshots(),
      
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                
                 int total = 0;
                 total = total + document['price'];
                print(total );
                  return ListTile( 
                  leading: Image.asset(document['imagepath']),
                  title: new Text(document['title']),
                  subtitle: new Text(document['price'].toString()),
                   trailing: Container(
                     child: Text(total.toString()),
                     
                   ),
                  
                  
                );
                
                
                 
              }).toList(),
              
            );
            
            
        }
      },
      
    ),
        ),
        
      
      bottomNavigationBar: Container(
              child: Row(
                children: <Widget>[
                  Expanded(child:ListTile(
                    title: Text('Total'),
                    //subtitle: Text(total.toString()),
                  )
                  )
                ],
              ),
            ),
      
      
       
      );
      
    
  }

}
/* 
class ShoppingCart extends StatelessWidget {
  final user;
  
  ShoppingCart(this.user, );
  
  @override
  
  Widget build(BuildContext context) {
    int total = 0;
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection(user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.documents.map((DocumentSnapshot document) {
                
                 
                total = total + document['price'];
                print(total );
                  return ListTile( 
                  leading: Image.asset(document['imagepath']),
                  title: new Text(document['title']),
                  subtitle: new Text(document['price'].toString()),
                   trailing: Container(
                     child: Text(total.toString()),
                   ),
                  
                  
                );
                
                
                 
              }).toList(),
              
            );
            
        }
      },
      
    );
    
  }
} */



