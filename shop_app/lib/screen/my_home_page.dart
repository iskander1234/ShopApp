import 'package:flutter/material.dart';
import '../widget/my_home_page_widget.dart';
import 'package:shop_app/widget/Badge.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/cart.dart';
import 'package:shop_app/screen/cart_screen.dart';
enum Options {
  all,
  favorites,
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _showFav = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY SHOP'),
        actions: [
          PopupMenuButton(
            onSelected: (Options userselect){
              setState(() {
                  if(userselect == Options.favorites){
                   _showFav=true;
                 }else{
                    _showFav=false;
                 }
                });
              }, 
              itemBuilder: (_)=>[
                PopupMenuItem(child: Text(
                  'Favorites',
                ),
                value: Options.favorites,
                ),
                PopupMenuItem(child: Text(
                  'All Products',
                ),
                value: Options.all,
                ),
              ],
            ),
          Consumer<CartData>(
            builder: (context,cart,child)=>Badge(
            child: child,
            value: cart.cartItemlength.toString(),
          ),
          child: IconButton(
              onPressed: (){
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: MyHomePageWidget(_showFav),
    );
  }
}