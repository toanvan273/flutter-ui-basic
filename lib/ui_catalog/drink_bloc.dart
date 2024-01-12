import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';


/********** _EVENT **********/
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

abstract class OrderEvent{}
final class OrderAddQuantityEvent extends OrderEvent{
  int id;
  int quantity;

  OrderAddQuantityEvent(this.id, this.quantity);
}
/********** _BLOC **********/

class DrinkBloc extends Bloc<OrderEvent, DrinkState>{
  DrinkBloc():super(DrinkState([])){

  }
}

/********** _STATE **********/

class DrinkState {
  List<ProductOrder> listProductOrder;

  DrinkState(this.listProductOrder);

  ProductOrder findProduct(int id){
    var productOrder = listProductOrder.firstWhere((p) => p.product?.id==id);
    return productOrder;
  }

}









