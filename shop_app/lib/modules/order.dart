import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class Order {
  final String id;
  final double amount;
  final List<Cart> products;
  final DateTime dateTime;
  final String imageUrl;

  Order({this.dateTime,this.imageUrl,this.id,this.products,this.amount});

}

class Orders with ChangeNotifier{
  
  List<Order> _orders=[];

  List<Order> get orders{
    return[..._orders];
  }

  void addOrder(List<Cart> cartProducts, double total){
    _orders.insert(0, Order(
      id: DateTime.now().toString(),
      amount: total,
      dateTime: DateTime.now(),
      products: cartProducts
    ));
  notifyListeners();
  }

}