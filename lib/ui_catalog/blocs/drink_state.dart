import 'package:equatable/equatable.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';

class DrinkState extends Equatable{
  List<ProductOrder> listProductOrder;
  ProductOrder? productOrder;

  DrinkState(this.listProductOrder, this.productOrder);

  DrinkState saveProductOrder({
    required Product product,
    int? quantity,
    Topping? topping,
    double? sugar,
    double? ice,
    String? note
  }){
    List<Topping> inittoppings = [...?productOrder?.toppings];
    if(topping != null){
      var checkTopping = inittoppings.isNotEmpty? inittoppings.indexWhere((element) => element.id == topping.id) : -1;
      if(checkTopping == -1){
        inittoppings.add(topping);
      }else{
        inittoppings.removeWhere((element) => element.id == topping.id);
      }
    }
    var newOrder = ProductOrder(
        product: product,
        quantity: quantity ?? productOrder?.quantity,
        toppings: inittoppings,
        sugar: sugar ?? productOrder?.sugar,
        ice: ice ?? productOrder?.ice,
        note: note ?? productOrder?.note
    );
    return DrinkState(listProductOrder, newOrder);
  }

  DrinkState addProductToList(){
    if(productOrder != null){
      List<ProductOrder> list = [...listProductOrder, productOrder!];
      return DrinkState(list, null);
    }
    return DrinkState(listProductOrder, productOrder);
  }

  int get getLength {
    return listProductOrder.length;
  }

  double get totalPrices {
    if(listProductOrder.isNotEmpty){
      double total = 0;
      for (var p in listProductOrder) {
        int quantity = p.quantity ?? 1;
        total = total + (p.product.price * quantity);
      }
      return total;
    }
    return 0;
  }

  factory DrinkState.fromJson(Map<String, dynamic> json) {
    return DrinkState(
      List<ProductOrder>.from(json["listProductOrder"]).map((i) =>
          ProductOrder.fromJson(i as Map<String, dynamic>)).toList(),
      ProductOrder.fromJson(json["productOrder"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "listProductOrder": listProductOrder.map((e) => e.toJson()).toList(),
      "productOrder": productOrder?.toJson(),
    };
  }

  @override
  List<Object?> get props => [listProductOrder, productOrder];
}


