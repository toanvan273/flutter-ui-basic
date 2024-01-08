import 'package:flutter_ui/ui_catalog/Product.dart';

abstract class CartEvent {}

final class CartEventAdd extends CartEvent {
  Product product;
  CartEventAdd(this.product);
}

final class CartEventRemove extends CartEvent {
  int id;
  CartEventRemove(this.id);
}

class CartState {
  List<Product> products;
  CartState(this.products);

  CartState copyWith({List<Product>? list}){
    return CartState( list ?? this.products);
  }

  CartState addProduct(Product product){
    var lists = [...products, product];
    return CartState(lists);
  }

  CartState removeAllProduct(){
    return CartState([]);
  }

  CartState removeProduct(int id){
    final index = products.indexWhere((element) => element.id == id);
    if(index>=0){
      products.removeAt(index);
      return CartState(products);
    }
    return CartState(products);
  }

  int get getLength {
    return products.length;
  }

  double get totalPrices {
    if(products.isNotEmpty){
      double total = 0;
      for (var element in products) {
        total += element.price;
      }
      return total;
    }
    return 0;
  }
}