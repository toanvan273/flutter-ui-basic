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
}

class ProductOrder {
  Product product;
  int quantity;
  int saled;
  int like;
  List<Topping> toppings;
  double sugar;
  double ice;
  String note;

  ProductOrder(this.product, this.quantity, this.saled, this.like,
      this.toppings, this.sugar, this.ice, this.note);
}

List<Topping> allTopping = <Topping>[

];