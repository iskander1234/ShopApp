import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/modules/order.dart';
import 'dart:math';
class OrderItem extends StatefulWidget {
  final Order order;
  OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanses=false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('\$ ${widget.order.amount}'),
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),),
            trailing: IconButton(
              onPressed: (){
                setState(() {
                   _expanses=! _expanses;
                });
              },
              icon: Icon(_expanses? Icons.expand_less:Icons.expand_more),
            ),
          ),
          if (_expanses)
            Container(
              padding: EdgeInsets.all(10),
              height: min(widget.order.products.length*20.0+10+100, 180),
              child: ListView(
                children: 
                  widget.order.products.map((item) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.title, style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w900,
                      ),),
                      Text('${item.quantity} X ${item.price}', style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold,
                      ),)
                    ],
                  )).toList()
              ),
            )
        ],
      ),
    );
  }
}
