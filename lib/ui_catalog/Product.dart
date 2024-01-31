import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
   int id;
   String name;
   String color;
   double price;

  Product({
    required this.id,
    required this.color,
    required this.name,
    required this.price
  });


   factory Product.fromJson(Map<String, dynamic> json) {
     print('Product day: $json');
     print(json["color"]);
     try{
       final ar = Product(
         id: int.parse(json["id"]),
         name: json["name"],
         color:  (json["color"]),
         price: double.parse(json["price"]),
       );
     }catch(err){
       print('err222 $err');
     }
    return Product(
      id: int.parse(json["id"]),
      name: json["name"],
      color: json["color"],
      price: double.parse(json["price"]),
    );
  }


   Map<String, dynamic> toJson() {
     // int testingColorValue = color;
     // String testingColorString = testingColorValue.toString();
    return {
      "id": id,
      "name": name,
      "color": color,
      "price": price,
    };
  }

  @override
  String toString() {
    return 'id: $id Name: $name Price: $price';
  }

  @override
  List<Object?> get props => [id, name, price, color];
}

List<Product> products = <Product>[
  Product(id:1, name: 'Trà chanh giã tay', color: Colors.green.toHex(), price: 1),
  Product(id:2, name: 'Ô Long nướng sữa phô mai', color: Colors.redAccent.toHex(), price: 1000),
  Product(id:3, name: 'Trà sữa nướng phô mai', color: Colors.white.toHex(), price: 800),
  Product(id:4, name: 'Hồng trà sữa phô mai', color: Colors.black12.toHex(), price: 600),
  Product(id:5, name: 'Cà phê sữa đá', color: Colors.white.toHex(), price: 15),
  Product(id:6, name: 'Bạc xỉu', color: Colors.white70.toHex(), price: 12),
  Product(id:7, name: 'Sinh tố bơ', color: Colors.cyanAccent.toHex(), price: 4),
  Product(id:8, name: 'Sinh tố xoài', color: Colors.black54.toHex(), price: 24),
  Product(id:9, name: 'Cà phê muối', color: Colors.black45.toHex(), price: 15),
  Product(id:10, name: 'Xanh sữa nướng phô mai', color: Colors.greenAccent.toHex(), price: 1),
  Product(id:11, name: 'Nước chanh Quảng Đông', color: Colors.pinkAccent.toHex(), price: 50),
  Product(id:12, name: 'Xô trà ô long mãng cầu', color: Colors.yellow.toHex(), price: 10),
  Product(id:12, name: 'Xô trà sữa nướng chân châu đường đen', color: Colors.purple.toHex(), price: 10),
  Product(id:12, name: 'Xô trà sữa nướng thiên thảo lục vị', color: Colors.blueAccent.toHex(), price: 10),
  Product(id:12, name: 'Xô dưa hấu cốt dừa', color: Colors.brown.toHex(), price: 10),
  Product(id:12, name: 'Xô trà xanh mãng cầu', color: Colors.pink.toHex(), price: 10),

];

class Topping extends Equatable{
  int id;
  String name;
  int price;

  Topping(this.id, this.name, this.price);


  factory Topping.fromJson(Map<String, dynamic> json) {
    print('Topping--json: $json');
    return Topping(
      json["id"],
      json["name"],
      json["price"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "price": price,
    };
  }

  @override
  String toString() {
    return 'Topping {id: $id name: $name price: $price}';
  }

  @override
  List<Object?> get props => [id, name, price];
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



  factory ProductOrder.fromJson(Map<String, dynamic> jsonMap) {
    print('jsonMap: $jsonMap');
    dynamic iProduct = jsonMap['product'];
    try{
      final a =  ProductOrder(
        product: Product.fromJson(iProduct),
        quantity: jsonMap["quantity"] != null ? int.parse(jsonMap["quantity"]) : null,
        saled: jsonMap["saled"] != null ? int.parse(jsonMap["saled"]) : null,
        like: jsonMap["like"] != null ? int.parse(jsonMap["like"]) : null,
        sugar: jsonMap["sugar"] != null ? double.parse(jsonMap["sugar"]) : null,
        ice: jsonMap["ice"] != null ? double.parse(jsonMap["ice"]) : null,
        note: jsonMap["note"],
        toppings: List<Topping>.from(jsonMap["toppings"]?.map((i) => Topping.fromJson(i))),
      );
    }catch(err){
      print(err);
    }

    return ProductOrder(
      product: Product.fromJson(iProduct),
      quantity: jsonMap["quantity"] != null ? int.parse(jsonMap["quantity"]) : null,
      saled: jsonMap["saled"] != null ? int.parse(jsonMap["saled"]) : null,
      like: jsonMap["like"] != null ? int.parse(jsonMap["like"]) : null,
      sugar: jsonMap["sugar"] != null ? double.parse(jsonMap["sugar"]) : null,
      ice: jsonMap["ice"] != null ? double.parse(jsonMap["ice"]) : null,
      note: jsonMap["note"],
      toppings: List<Topping>.from(jsonMap["toppings"]?.map((i) => Topping.fromJson(i))),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "product": product.toJson(),
      "quantity": quantity,
      "saled": saled,
      "like": like,
      "toppings": toppings != null ? toppings?.map((e) => e.toJson()).toList() : '',
      "sugar": sugar,
      "ice": ice,
      "note": note,
    };
  }

  @override
  String toString() {
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

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}