import 'package:flutter_ui/ui_catalog/Product.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_event.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';


class DrinkBloc extends HydratedBloc<DrinkEvent, DrinkState>{
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
    on<DrinkDeleteOrderEvent>(_onDeleteOrder);
  }

  void _onDeleteOrder(DrinkDeleteOrderEvent event, Emitter<DrinkState> emit){
    List<ProductOrder> listOrder = List.from(state.listProductOrder)..remove(event.productOrder);
    emit(DrinkState(listOrder, state.productOrder));
  }

  @override
  DrinkState? fromJson(Map<String, dynamic> json) {
    return DrinkState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(DrinkState state) {
    return state.toJson();
  }
}


