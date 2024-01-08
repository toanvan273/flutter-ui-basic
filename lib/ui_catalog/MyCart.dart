import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/CartModel.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child){
          print('cart $cart');
          print(cart.getlength);
          return const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
            ),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text('Name Product')
                          ),
                          ElevatedButton(
                              child: Text('Delete'),
                              onPressed: null
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: Center(
                    child: Text('Total:', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}