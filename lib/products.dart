import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './product_details.dart';

class Products extends StatefulWidget {
  final FirebaseUser user;
  final docCount;
  Products(this.user, this.docCount);
  
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productlist = [
    {
      "name": "Blazer",
      "picture": "assets/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red Dress",
      "picture": "assets/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Black Dress",
      "picture": "assets/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Blazer2",
      "picture": "assets/blazer2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Pants",
      "picture": "assets/pants1.jpg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Shoes",
      "picture": "assets/shoe1.jpg",
      "old_price": 100,
      "price": 50,
    }
  ];
  

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productlist.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Singleprod(
            prodname: productlist[index]['name'],
            prodpricture: productlist[index]['picture'],
            prodoldprice: productlist[index]['old_price'],
            prodprice: productlist[index]['price'],
            user: widget.user,
            docCount: widget.docCount

          );
        });
  }
}

class Singleprod extends StatelessWidget {
  final prodname;
  final prodpricture;
  final prodoldprice;
  final prodprice;
  final FirebaseUser user;
  final docCount ;

  Singleprod({
    this.prodname,
    this.prodpricture,
    this.prodoldprice,
    this.prodprice,
    this.user,
    this.docCount
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Card(
          
          child: Material(
            child: InkWell(
              onTap: () => {Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> ProductDetails(prodname,  prodpricture, prodprice, prodoldprice , user, docCount)
              )
            )},
            
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                        leading: Text(
                          prodname,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        title: Text(
                          "\$$prodprice",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "\$$prodoldprice",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w800,
                              decoration
                                  :TextDecoration.lineThrough),
                        ),
                    ),
                  ),
                  child: Image.asset(
                    prodpricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}

/* import 'package:flutter/material.dart';
//personal imports
import './product_details.dart';

class Products extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductsState();
  }
}

class ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Blazer",
      "image": "assets/blazer1.jpeg",
      "old price": "120",
      "new price": "85"
    },
    {
      "name": "Red dress",
      "image": "assets/dress1.jpeg",
      "old price": "100",
      "new price": "50"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return ProductsList(
            product: productList[index]['name'],
            image: productList[index]['image'],
            oldPrice: productList[index]['old price'],
            newPrice: productList[index]['new price'],
          );
        });
  }
}

class ProductsList extends StatelessWidget {
  final product;
  final image;
  final oldPrice;
  final newPrice;

  ProductsList({this.product, this.image, this.oldPrice, this.newPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: 'product',
      child: Material(
        child: InkWell(
          onTap: ()=> {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context)=> ProductDetails()
              )
            )
          },
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(product + '       ',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0)),
                title: Text(
                  newPrice + '/-',
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(oldPrice + '/-',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Colors.red,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        )
      
          )
      )
    );
        
  }
}
 */