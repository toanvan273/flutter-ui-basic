import 'package:flutter_bloc/flutter_bloc.dart';
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
final class CartEventRemoveAll extends CartEvent{}



class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc():super(CartState([])) {
   on<CartEventAdd>((event, emit) => emit(state.addProduct(event.product)));
   on<CartEventRemove>((event, emit) => emit(state.removeProduct(event.id)));
   on<CartEventRemoveAll>((event, emit) => emit(state.removeAllProduct()));
  }
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


  // @override
  // String toString() {
  //   // TODO: implement toString
  //   return products.map((e) => e.toString());
  // }
}