import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/product.dart';

class ProductsDetailesScreen extends StatefulWidget {
  static const routeName = 'ProductsDetailesScreen';
  @override
  _ProductsDetailesScreenState createState() => _ProductsDetailesScreenState();
}

class _ProductsDetailesScreenState extends State<ProductsDetailesScreen> {
  
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context).settings.arguments as String;
    final loadingProduct=Provider.of<ProductsData>(context).findProduct(productId);
    return Scaffold(
      appBar: AppBar(title: Text(loadingProduct.title),
      ),
      body: Container(
      child: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadingProduct.imageUrl,
                fit: BoxFit.cover,
               ),
              ),
          SizedBox(height: 20,),
          Text('\$ ${loadingProduct.price}', style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.w900)),
          SizedBox(height: 20,),
          Text(loadingProduct.description, style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold)),
        ],
      ),
    ),
    );
  }
}
