import 'package:flutter/material.dart';
import 'package:shop_app/modules/cart.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widget/cart.item.dart';
import 'package:shop_app/modules/order.dart';
import 'package:shop_app/screen/order.sceen.dart';
class CartScreen extends StatelessWidget {
  static const routeName = 'CartScreen';
  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            elevation: 6,
            color: Theme.of(context).primaryColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Total : ', 
                  style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.w900),
                   ),
                ),
                Spacer(),
                Text('\$ ${cartData.totalAmount.toStringAsFixed(2)}', 
                style: TextStyle(color: Colors.white, fontSize: 30.0,fontWeight: FontWeight.w900),
                ),
                FlatButton(
                  onPressed: (){
                    Provider.of<Orders>(context,listen: false).addOrder
                    (cartData.items.values.toList(),
                     cartData.totalAmount);
                     cartData.clear();
                     Navigator.pushNamed(context, OrderSreen.routeName);
                  }, 
                child: 
                Text('OrderNow', 
                style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w900),),
                 textColor: Theme.of(context).accentColor,)
              ],
            )
          ),
        ),
        Expanded(
              child: ListView.builder(
              itemBuilder: (context,index)=>CartItem(
              title: cartData.items.values.toList()[index].title,
              quantity: cartData.items.values.toList()[index].quantity,
              price: cartData.items.values.toList()[index].price,
              imageUrl: cartData.items.values.toList()[index].imageUrl,
            ),
            itemCount: cartData.items.length,
            ),
        ),
      ],
        ),
    );
  }
}
