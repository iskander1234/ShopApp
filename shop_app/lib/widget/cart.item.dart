import 'package:flutter/material.dart';
class CartItem extends StatelessWidget{
    final String imageUrl;
    final String title;
    final int quantity;
    final double price;
    CartItem({this.quantity,this.price,this.imageUrl,this.title});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: CircleAvatar(

          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(title + '     \$ $price'),
        subtitle: Text('Total: \$ ${price*quantity}'),
        trailing: Text('$quantity X'),
      ),
    );
  }
}

