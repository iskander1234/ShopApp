import 'package:flutter/material.dart';
import 'screen/my_home_page.dart';
import 'package:provider/provider.dart';
import 'modules/product.dart';
import 'screen/products_detailes_screen.dart';
import 'package:shop_app/modules/cart.dart';
import 'screen/cart_screen.dart';
import 'modules/order.dart';
import 'screen/order.sceen.dart';
void main() {
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (context)=>ProductsData(),),
        ChangeNotifierProvider(
        create: (context)=>CartData(),),
        ChangeNotifierProvider(
        create: (context)=>Orders(),),
    ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.purple, 
        ),
        home: MyHomePage(),
        routes: {
          ProductsDetailesScreen.routeName:(context)=>
          ProductsDetailesScreen(),
          CartScreen.routeName:(context)=>
          CartScreen(),
          OrderSreen.routeName:(context)=>
          OrderSreen(),
        },
      )
    );
  }
}