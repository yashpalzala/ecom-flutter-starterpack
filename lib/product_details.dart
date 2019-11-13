import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import './main.dart';

class ProductDetails extends StatefulWidget {
  final prodName;
  final prodImage;
  final prodPrice;
  final prodOldPrice;
  final FirebaseUser user;
  final docCount;

  ProductDetails(this.prodName, this.prodImage, this.prodPrice,
      this.prodOldPrice, this.user , this.docCount);

  @override
  State<StatefulWidget> createState() {
    return _ProductDetailsState();
  }
}

class _ProductDetailsState extends State<ProductDetails> {
  var sizes = ['1', '2', '3'];
  String sizeSelected = '1';
  
  

  @override

  

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 100,
          backgroundColor: Colors.deepOrangeAccent[400],
          title: Text('fashapp'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: Hero(
                tag: widget.prodName,
                child: Image.asset(widget.prodImage),
              ),
            ),
            //========= BUTTONS==============>
            Row(
              children: <Widget>[
                //<=============Size===============>
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('size'),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            items: sizes.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this.sizeSelected = newValueSelected;
                              });
                            },
                            value: sizeSelected,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //<=============Size===============>
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(child: Text('color')),
                        Expanded(
                          child: DropdownButton<String>(
                            items: sizes.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this.sizeSelected = newValueSelected;
                              });
                            },
                            value: sizeSelected,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                //<=============Size===============>
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Colors.grey,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Qty'),
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            items: sizes.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(dropDownStringItem),
                              );
                            }).toList(),
                            onChanged: (String newValueSelected) {
                              setState(() {
                                this.sizeSelected = newValueSelected;
                              });
                            },
                            value: sizeSelected,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                            color: Colors.red,
                            onPressed: () {
                              print('dabayyya');
                              
                              print('yeeeeee kyaa hua, kaise huaaaa');
                            },
                            child: Text(
                              'Buy Now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        IconButton(
                          padding: EdgeInsets.only(left: 25.0, right: 15.0),
                          onPressed: () {
                            
                            Firestore.instance
                                .collection(widget.user.uid)
                                .document()
                                .setData({
                              'title': widget.prodName,
                              'price': widget.prodPrice,
                              'imagepath': widget.prodImage,
                            });
                            print(widget.user.uid+ widget.prodName);
                          },
                          icon: Icon(Icons.add_shopping_cart),
                        ),
                        IconButton(
                          padding: EdgeInsets.all(5.0),
                          onPressed: () {},
                          icon: Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
            //<================ Buy button=============>
          ],
        ));
  }
}
