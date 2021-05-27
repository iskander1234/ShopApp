import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart{
    final String id;
    final String imageUrl;
    final String title;
    final double price;
    final int quantity;

    Cart({this.title,this.imageUrl,this.id,this.price,this.quantity,});


}

class CartData with ChangeNotifier{
  Map<String, Cart>  _CartItem={};

  Map<String, Cart> get items {
    return{..._CartItem};
  }

  void addItem(String id, double price, String title, String imageUrl){
    if (_CartItem.containsKey(id)){
      _CartItem.update(id, (item) => Cart(
        id: item.id,
        title: item.title,
        imageUrl: item.imageUrl,
        quantity: item.quantity+1,
        price: item.price,
      ),
      );
    }else{
      _CartItem.putIfAbsent(
        id, 
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          imageUrl: imageUrl,
          quantity: 1,
          price: price,
        )
      );
    }
    notifyListeners();
  }

  int get cartItemlength{
    return _CartItem.length;
  }

  double get totalAmount{
    var total=0.0;
    _CartItem.forEach((i, cartItem) { 
      total += cartItem.price*cartItem.quantity;
    });
    return total;
  }


  void clear(){
    _CartItem={};
    notifyListeners();
  }
}