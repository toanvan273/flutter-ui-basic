import 'package:flutter_ui/ui_catalog/Product.dart';

abstract class DrinkEvent{}

final class DrinkAddEvent extends DrinkEvent{
  ProductOrder productOrder;
  DrinkAddEvent(this.productOrder);
}
final class DrinkSaveEvent extends DrinkEvent {}

final class DrinkResetEvent extends DrinkEvent{
  bool selected;
  int idReset;

  DrinkResetEvent(this.selected, this.idReset);
}