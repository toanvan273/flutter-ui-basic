import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/CartModel.dart';
import 'package:flutter_ui/ui_catalog/MyCart.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';
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
            Consumer<CartModel>(builder: (context, cart, child){
              print('object ${cart.totalPrice}');
              return Text('Total price: ${cart.getlength.toString()}');
            }),
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
  final cart = CartModel();

  void handleAddProduct(){
    cart.add(product);
  }
  @override
  State<StatefulWidget> createState() => ActionButton();
}

class ActionButton extends State<Actions> {
  bool added = false;

  @override
  Widget build(BuildContext context) {
    return !added ? ElevatedButton(
        onPressed:  (){
          widget.handleAddProduct();
          setState(() {
            added = !added;
          });
        }
        , child: const Text('Add')
    ) : const ElevatedButton(onPressed: null, child: Icon(Icons.check));
  }
}