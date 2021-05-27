import 'package:flutter/material.dart';

class Product with ChangeNotifier{
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final String description;
  bool favorite;

  Product(
      {
        @required this.title,
        @required this.price,
        @required this.imageUrl,
        @required this.description,
        @required this.id,
        this.favorite=false
      }
    ); 

  
  void isFavorite(){
    favorite =! favorite;
    notifyListeners();
  }
}

class ProductsData with ChangeNotifier{
    List<Product> _Products = [
      Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red!',
        price: 29.99,
        imageUrl: 
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSRPvHeZ45qqRXhpTIhGzbPF7-o0t4tGErq0Q&usqp=CAU'
      ),
      Product(
        id: 'p2',
        title: 'Purple Colour Shirt',
        description: 'Men\'s Solid Slim Fit Formal Shirt',
        price: 40.00,
        imageUrl: 
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSiOVae_XLoQuY5n-jfSXhaQWEyXfgpB-07EA&usqp=CAU'
      ),
      Product(
        id: 'p3',
        title: 'DJ BAG',
        description: 'Сумки и кейсы для музыкального оборудования от DJ BAG',
        price: 30.86,
        imageUrl: 
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8hYDxzA-MkWmhBd1EjSa3xOqNid06dRuI4Q&usqp=CAU'
      ),
      Product(
        id: 'p4',
        title: 'Iphone Xr',
        description: 'Iphone Xr Самый лучший смартфон на даный момент !!!',
        price: 255.99,
        imageUrl: 
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR99lMxWlmqBHOe6qmnPHOiuxfxsBZKxrW_hQ&usqp=CAU'
      ),
    ];

    List<Product> get productItem{
      return[..._Products];
    }

    Product findProduct(String id){
     return _Products.firstWhere((productId) => productId.id==id);
    }


    List<Product> get favoriteProducts{
      return _Products.where((productItem) => productItem.favorite).toList();
    }

}