import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/modules/order.dart';
import 'package:shop_app/widget/orderItems.dart';

class OrderSreen extends StatelessWidget {
  static const routeName='OrderSreen' ;
  @override
  Widget build(BuildContext context) {
    final  orderData=Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title : Text('You Order')
        ),
        body: ListView.builder(itemBuilder: (context,index)=> 
        OrderItem(orderData.orders[index])
        ,itemCount: orderData.orders.length,
        ),
    );
  }
}
