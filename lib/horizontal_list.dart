import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Categories('tshirts', 'assets/icons8-cute-clipart-50.png'),
          Categories('tshirts', 'assets/tshirts.png'),
          Categories('tshirts', 'assets/tshirts.png'),
          Categories('tshirts', 'assets/tshirts.png'),
          Categories('tshirts', 'assets/tshirts.svg'),
          Categories('tshirts', 'assets/tshirts.svg'),
          Categories('tshirts', 'assets/tshirts.svg'),
          
        ],
      ),
    );
  }

}

class Categories extends StatelessWidget{
  final String imagelocation;
  final String imageCaption;

  Categories(this.imageCaption,this.imagelocation);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 100.0,
      
      child: Column(
        children: <Widget>[
          ListTile(
            title: Image.asset(imagelocation,),
            onTap: (){},
            subtitle: Text(imageCaption, textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }

}