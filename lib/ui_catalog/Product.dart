import 'dart:ui';
import 'package:flutter/material.dart';

class Product {
   int id;
   String name;
   Color color;
   double price;

  // Product(this.id, this.name, this.color, this.price);
  Product({
    required this.id,
    required this.color,
    required this.name,
    required this.price
  });

  @override
  String toString() {
    return 'id: $id Name: $name Price: $price';
  }
}

List<Product> products = <Product>[
  Product(id:1, name: 'Trà chanh giã tay', color: Colors.green, price: 1),
  Product(id:2, name: 'Ô Long nướng sữa phô mai', color: Colors.redAccent, price: 1000),
  Product(id:3, name: 'Trà sữa nướng phô mai', color: Colors.white, price: 800),
  Product(id:4, name: 'Hồng trà sữa phô mai', color: Colors.black12, price: 600),
  Product(id:5, name: 'Cà phê sữa đá', color: Colors.white12, price: 15),
  Product(id:6, name: 'Bạc xỉu', color: Colors.white70, price: 12),
  Product(id:7, name: 'Sinh tố bơ', color: Colors.cyanAccent, price: 4),
  Product(id:8, name: 'Sinh tố xoài', color: Colors.black54, price: 24),
  Product(id:9, name: 'Cà phê muối', color: Colors.black45, price: 15),
  Product(id:10, name: 'Xanh sữa nướng phô mai', color: Colors.greenAccent, price: 1),
  Product(id:11, name: 'Nước chanh Quảng Đông', color: Colors.pinkAccent, price: 50),
  Product(id:12, name: 'Xô trà ô long mãng cầu', color: Colors.yellow, price: 10),
  Product(id:12, name: 'Xô trà sữa nướng chân châu đường đen', color: Colors.purple, price: 10),
  Product(id:12, name: 'Xô trà sữa nướng thiên thảo lục vị', color: Colors.blueAccent, price: 10),
  Product(id:12, name: 'Xô dưa hấu cốt dừa', color: Colors.brown, price: 10),
  Product(id:12, name: 'Xô trà xanh mãng cầu', color: Colors.pink, price: 10),

];

class Topping{
  int id;
  String name;
  int price;

  Topping(this.id, this.name, this.price);
  @override
  String toString() {
    return 'Topping {id: $id name: $name price: $price}';
  }
}

class Sugar{
  int id;
  double level;
  int price;

  Sugar(this.id, this.level, this.price);
  @override
  String toString() {
    return 'Sugar {id: $id level: $level price: $price}';
  }
}

List<Sugar> sugarList = <Sugar>[
  Sugar(1, 1.0, 0),
  Sugar(2, 0.7, 0),
  Sugar(3, 0.5, 0),
  Sugar(4, 0.3, 0),
  Sugar(5, 0, 0)
];

class ProductOrder {
  Product product;
  int? quantity;
  int? saled;
  int? like;
  List<Topping>? toppings = [];
  double? sugar;
  double? ice;
  String? note;

  ProductOrder({
    required this.product,
    this.quantity,
    this.saled,
    this.like,
    this.toppings,
    this.sugar,
    this.ice,
    this.note
  });

  ProductOrder copyWith({
    required Product product,
    int? quantity,
    int? saled,
    int? like,
    List<Topping>? toppings,
    double? sugar,
    double? ice,
    String? note
  }){
  return ProductOrder(
      product: product,
      quantity: quantity ?? this.quantity,
      saled: saled ?? this.saled,
      like: saled ?? this.saled,
      toppings: toppings??this.toppings,
      sugar: sugar?? this.sugar,
      ice: ice??this.ice,
      note: note??this.note
  );
 }
 @override
  String toString() {
    // TODO: implement toString
    return 'Product: {${product.toString()}} '
        ' quantity: $quantity'
        ' saled: $saled'
        ' like $like'
        ' topping ${toppings?.length}'
        ' sugar: $sugar'
        ' ice: $ice'
        ' note: $note';
  }
}

List<Topping> allTopping = <Topping>[
  Topping(1, 'Pudding', 20),
  Topping(2, 'Kem trung', 10),
  Topping(3, 'Chan chau', 5),
  Topping(4, 'Trân Châu Hoàng Kim', 7),
  Topping(5, 'Dau do', 7),
  Topping(6, 'Thach den', 7),
  Topping(7, 'Thach den', 7),
  Topping(8, 'Tran Chau Den', 7),
  Topping(9, 'Kem Chese', 7),
  Topping(10, 'Chan Chau Trang', 7),
  Topping(11, 'Kem Dua', 7),
  Topping(12, 'Kem Trung', 7)
];