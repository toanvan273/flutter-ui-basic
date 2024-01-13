import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';


/********** _EVENT **********/
abstract class DrinkEvent{}

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
}

final class DrinkAddOrderEvent extends DrinkEvent{

}
/********** _BLOC **********/

class DrinkBloc extends Bloc<DrinkEvent, DrinkState>{
  DrinkBloc():super(DrinkState([],null)){
    on<DrinkAddEvent>((event,emit) => emit(
        state.saveProductOrder(
            product: event.product,
            quantity: event.quantity,
            topping: event.topping,
            sugar: event.sugar,
          ice: event.ice,
          note: event.note
        )));

    on<DrinkAddOrderEvent>((event, emit) => emit(state.addProductToList()));
  }
}

/********** _STATE **********/

class DrinkState {
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
      var checkTopping = inittoppings.length>0? inittoppings.indexWhere((element) => element.id == topping.id) : -1;
      if(checkTopping == -1){
        inittoppings.add(topping);
      }else{
        inittoppings.removeWhere((element) => element.id == topping?.id);
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
      // listProductOrder.add(productOrder!);
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
}









