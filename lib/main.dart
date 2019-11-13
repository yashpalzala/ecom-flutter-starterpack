import 'package:animate/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import './horizontal_list.dart';
import './products.dart';
import './shoppingcart.dart';
import './signin.dart';
import './yoyo.dart';

void main() => runApp(RootPage());

class Home extends StatelessWidget {
  final user;
  Home({this.user});

  @override
  Widget build(BuildContext context) {
    return MyApp(
      user: user,
    );
  }
}

class MyApp extends StatefulWidget {
  
  final user;
  MyApp({this.user});
  
  @override
  State<StatefulWidget> createState() {
    return MyAppstate();
  }
}

class MyAppstate extends State<MyApp> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  
  bool isSignedIn;
  int docCount = 0;

  @override
  void initState() {
    setState(() {
      if (widget.user != null) {
        isSignedIn = true;
      } else {
        isSignedIn = false;
      }
    });

    /* setState(() {
     if (widget.user != null) {
       MaterialButton(
         onPressed: (){},
         child: Text('logout'),
       );
     } else{
       MaterialButton(
         onPressed: (){},
         child: Text('login'),
       );
     }
    }); */
    super.initState();
  }

  void docCountIncr (){
    docCount++;
  }

  Widget isSignedInWid() {
    return MaterialButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        setState(() {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => RootPage()));
        });
      },
      child: Text('logout'),
    );
  }

  Widget isSignedOutWid() {
    return MaterialButton(
      onPressed: () {
        print('login tapped');
        setState(() {
          try {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => RootPage()));
          } catch (e) {
            print(e.message);
          }
        });
      },
      child: Text('login'),
    );
  }


  Widget build(BuildContext context) {
    Widget imageCarousel = SizedBox(
        height: 200,
        child: Carousel(
          boxFit: BoxFit.cover,
          images: [
            
            Image.asset('assets/taylor.jpg', fit: BoxFit.cover),
            Image.asset('assets/img2.jpg',
            ),
            Image.asset('assets/img3.jpg',
            fit: BoxFit.fill),
            Image.asset('assets/img4.jpg',
            fit: BoxFit.fill),
          ],
          autoplay: true,
          dotBgColor: Colors.transparent,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
        ));

    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 100,
              backgroundColor: Colors.deepOrangeAccent[400],
              title: Text('fashapp'),
              leading: IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () => _scaffoldKey.currentState.openDrawer()),
              actions: <Widget>[
                Center(child: isSignedIn ? isSignedInWid() : isSignedOutWid()),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: null,
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    
                    print('tapped');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Cart(user:widget.user),
                      ),
                    );
                  },
                )
              ],
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      accountName: Text('yashpal'),
                      accountEmail: Text('${widget.user.email}'),
                      currentAccountPicture: CircleAvatar(
                        child: ImageIcon(AssetImage('assets/DSC_0049.jpg')),
                      )),
                  ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('My Acoount'),
                    leading: Icon(Icons.account_circle),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('My Orders'),
                    leading: Icon(Icons.shopping_basket),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Categories'),
                    leading: Icon(Icons.category),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Favorites'),
                    leading: Icon(Icons.favorite),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  Divider(),
                  ListTile(
                    title: Text('Settings'),
                    leading: Icon(Icons.settings, color: Colors.blue),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('About Us'),
                    leading: Icon(
                      Icons.help,
                      color: Colors.blueGrey,
                    ),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
            body: ListView(
              children: <Widget>[
                imageCarousel,
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Categories',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                HorizontalList(),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Recent Products',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Container(height: 320.0, child: Products(widget.user, docCount))
              ],
            )),
      ),
    );
  }
}
