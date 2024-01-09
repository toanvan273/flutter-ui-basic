import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/MyCart.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';
import 'package:flutter_ui/ui_catalog/cart_bloc.dart';
import 'package:provider/provider.dart';

class MyCatalog extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Catalog'),
          backgroundColor: Colors.yellow,
          actions: [
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state){
                return Text('Total price: ${state.totalPrices}');
              },
            ),
            const SizedBox(
              width: 20,
            ),
            Builder(builder: (context){
              return InkWell(
                child: Icon(Icons.shopping_cart),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyCart())
                  );
                },
              );
            }),
            Padding(padding: EdgeInsets.only(right: 20))
          ],
        ),
        body: _MyCatalog(),
      ),
    );
  }
}

class _MyCatalog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (final product in products)
            ProductItem(
                product
            )
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  Product item;

  ProductItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              color: item.color,
              child: Center(
                child: Text('${item.price.toInt()}' + "\$"),
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            Expanded(
              child: Text(item.name),
            ),
            Actions(item)
          ],
        ),
    );
  }
}

class Actions extends StatefulWidget {
  Product product;
  Actions(this.product, {super.key});

  @override
  State<StatefulWidget> createState() => ActionButton();
}

class ActionButton extends State<Actions> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state){
        dynamic pExit = state.products.indexWhere((e) => e.id == widget.product.id);
        if(state.getLength == 0 || pExit<0){
          return ElevatedButton(
              onPressed:  (){
                context.read<CartBloc>().add(CartEventAdd(widget.product));
                setState(() {
                  added = !added;
                });
              }
              , child: const Text('Add')
          );
        }
        return Container(
          child: !added ? ElevatedButton(
              onPressed:  (){
                context.read<CartBloc>().add(CartEventAdd(widget.product));
                setState(() {
                  added = !added;
                });
              }
              , child: const Text('Add')
          ) : const ElevatedButton(onPressed: null, child: Icon(Icons.check)),
        );
      },
    );
  }
}