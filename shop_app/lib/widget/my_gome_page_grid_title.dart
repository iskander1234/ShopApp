import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/cart.dart';
import 'package:shop_app/modules/product.dart';
import 'package:shop_app/screen/products_detailes_screen.dart';
class MyHomePageGridTitle extends StatefulWidget {
  @override
  _MyHomePageGridTitleState createState() => _MyHomePageGridTitleState();
}

class _MyHomePageGridTitleState extends State<MyHomePageGridTitle> {
  @override
  Widget build(BuildContext context) {
    final singgelProduct=Provider.of<Product>(context,listen: false);
    final cartDate = Provider.of<CartData>(context,listen: false);
    return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ProductsDetailesScreen.routeName,
              arguments: singgelProduct.id);
            },
            child: Image.network(
            singgelProduct.imageUrl,
            fit: BoxFit.cover,
          ),
          ),
            footer: GridTileBar(
              backgroundColor: Colors.black87,
              leading: Consumer<Product>(
                builder: (context,product,_)=>
                IconButton(
                onPressed: (){
                  product.isFavorite();
                },
                icon: Icon(
                  product.favorite? Icons.favorite : Icons.favorite_border, 
                  color: Theme.of(context).errorColor,
                )
                ),
              ) ,
              title: Text(singgelProduct.title),
              trailing: IconButton(
                onPressed: (){
                  cartDate.addItem(singgelProduct.id, singgelProduct.price,
                   singgelProduct.title, singgelProduct.imageUrl);
                },
                icon: Icon(Icons.shopping_cart, color: Theme.of(context).accentColor),
        ),
        ),
      );
  }
}
