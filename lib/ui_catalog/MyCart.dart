import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/cart_bloc.dart';
import 'package:flutter_ui/ui_catalog/drink_bloc.dart';


class MyCart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state){
        print('check... ${state.listProductOrder}');
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Cart'),
            actions: state.getLength != 0 ?
            [
            InkWell(
              child: const Icon(Icons.remove_circle_outline),
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
            const Padding(padding: EdgeInsets.only(right: 20))
            ] : null,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
            ),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (final p in state.listProductOrder)
                          Row(
                            children: [
                              Expanded(
                                  child: Text('${p.product.name}')
                              ),
                              ElevatedButton(
                                  child: const Text('Delete'),
                                  onPressed: (){
                                    context.read<CartBloc>().add(CartEventRemove(p.product.id));
                                  }
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Total: ${state.totalPrices}', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        SizedBox(width: 20),
                        OutlinedButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            onPressed: () => _dialogBuilder1(context),
                            child: const Text('Submit')
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _dialogBuilder1(BuildContext context){
    return showDialog<void>(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Title'),
          content: const Text(
            'A dialog is a type of modal window that\n'
                'appears in front of app content to\n'
                'provide critical information, or prompt\n'
                'for a decision to be made.',
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Cancel'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child:  Text('Submit'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}