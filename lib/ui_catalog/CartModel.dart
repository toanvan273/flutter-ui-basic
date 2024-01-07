import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';

class CartModel extends ChangeNotifier{
  List<Product> _list = [];

  int get getlength {
    return _list.length;
  }
  double get totalPrice {
    print(_list.length);
    if(_list.isNotEmpty){
      double total = 0;
      for (var element in _list) {
        total += element.price;
      }
      return total;
    }
    return 0;
  }

  void add(Product product){
print('check ${product.price}');

    this._list.add(product);
    print(this._list);
    print(this._list.length);
    notifyListeners();
  }

  void removeAll(){
    _list.clear();
    notifyListeners();
  }

  void removeProduct(Product product){
    final index = _list.indexWhere((element) => element.id == product.id);
    if(index>=0){
      _list.removeAt(index);
      notifyListeners();
    }
  }

   UnmodifiableListView<Product> get products => UnmodifiableListView(_list);
}