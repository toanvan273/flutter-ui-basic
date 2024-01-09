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
  Product(id:1, name: 'Pen', color: Colors.green, price: 1),
  Product(id:2, name: 'Macbook', color: Colors.redAccent, price: 1000),
  Product(id:3, name: 'iphone', color: Colors.white, price: 800),
  Product(id:4, name: 'Samsung', color: Colors.black12, price: 600),
  Product(id:5, name: 'Pan', color: Colors.white12, price: 15),
  Product(id:6, name: 'Light', color: Colors.white70, price: 12),
  Product(id:7, name: 'Blutood', color: Colors.cyanAccent, price: 4),
  Product(id:8, name: 'Mouse', color: Colors.black54, price: 24),
  Product(id:9, name: 'Key boad', color: Colors.black45, price: 15),
  Product(id:10, name: 'Botle', color: Colors.greenAccent, price: 1),
  Product(id:11, name: 'Chair', color: Colors.pinkAccent, price: 50),
  Product(id:12, name: 'Table', color: Colors.yellow, price: 10),
];