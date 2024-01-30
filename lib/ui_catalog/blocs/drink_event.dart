
import 'package:equatable/equatable.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';

abstract class DrinkEvent extends Equatable{}

final class DrinkAddEvent extends DrinkEvent{
  Product product;
  int? quantity;
  Topping? topping;
  double? sugar;
  double? ice;
  String? note;

  DrinkAddEvent({
    required this.product,
    this.quantity,
    this.topping,
    this.sugar,
    this.ice,
    this.note
  });

  @override
  List<Object?> get props => [product, quantity, topping, sugar, ice, note];
}

final class DrinkAddOrderEvent extends DrinkEvent{
  @override
  List<Object?> get props => [];
}

final class DrinkDeleteOrderEvent extends DrinkEvent{
  ProductOrder productOrder;
  DrinkDeleteOrderEvent({required this.productOrder});
  @override
  List<Object?> get props => [productOrder];
}
