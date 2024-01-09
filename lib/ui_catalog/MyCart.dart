import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';
import 'package:flutter_ui/ui_catalog/cart_bloc.dart';


class MyCart extends StatelessWidget{
  VoidCallback? handleSubmit(Product p, BuildContext context){
    print(p);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            actions: state.getLength != 0 ?
            [
            InkWell(
              child: Icon(Icons.remove_circle_outline),
              onTap: (){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Are you sure to delete all your cart?'),
                      action: SnackBarAction(
                        label: 'Delete All',
                        onPressed: (){
                          context.read<CartBloc>().add(CartEventRemoveAll());
                          // Navigator.pop(context);
                        },
                      ),
                    )
                );
              },
            ),
            Padding(padding: EdgeInsets.only(right: 20))
            ] : null,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      for (final product in state.products)
                        Row(
                          children: [
                            Expanded(
                                child: Text('${product.name}')
                            ),
                            ElevatedButton(
                                child: Text('Delete'),
                                onPressed: (){
                                  context.read<CartBloc>().add(CartEventRemove(product.id));
                                }
                            )
                          ],
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('Total: ${state.totalPrices}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}