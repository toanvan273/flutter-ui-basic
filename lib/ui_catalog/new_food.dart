import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';

class AddNewFood extends StatefulWidget{
  final ProductOrder productOrder = ProductOrder();
  Product product;
  AddNewFood(this.product);

  @override
  State<StatefulWidget> createState() {
    return _AddNewFood();
  }
}

class _AddNewFood extends State<AddNewFood>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Center(
                            child: Text('Thêm món mới')
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.close),
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                ),
                Divider(),
                MyDrink(widget.product)
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: MyTopping(widget.product),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Thêm vào giỏ hàng 1000 \$'),
              onPressed: (){
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.deepOrangeAccent
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyDrink extends StatelessWidget{
  Product product;
  MyDrink(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            color: Colors.black45,
          ),
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(product.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                          const Row(
                            children: [
                              Text('717 da ban', style: TextStyle(color: Colors.black45, fontSize: 14),),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Text('|', style: TextStyle(color: Colors.black45, fontSize: 14)),
                              ),
                              Text('7 Luot thich', style: TextStyle(color: Colors.black45, fontSize: 14))
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text('${product.price*0.9}đ', style: TextStyle(color: Colors.black, fontSize: 14)),
                            SizedBox(width: 5),
                            Text('${product.price}đ', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),)
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            InkWell(
                              child: Container(
                                child: Icon(Icons.remove,color: Colors.deepOrange),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  border: Border.all(
                                    color:  Colors.deepOrange,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('1'),
                            ),
                            InkWell(
                              child: Container(
                                child: Icon(Icons.add, color: Colors.white,),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.deepOrange,
                                  border: Border.all(
                                    color:  Colors.deepOrange,
                                    style: BorderStyle.solid,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ])
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

class MyTopping extends StatefulWidget{
  Product product;

  MyTopping(this.product);

  @override
  State<StatefulWidget> createState() {
    return _MyTopping();
  }
}
class _MyTopping extends State<MyTopping>{
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FractionallySizedBox(
          widthFactor: 1,
          child:  Container(
            // margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            color: Colors.grey,
            child: Text('TOPPING (Topping, toi da 5)'),
          ),
        ),
        for(final topping in allTopping)
          RowItemCheckbox(topping)
      ],
    );
  }
}


class RowItemCheckbox extends StatefulWidget {
  final MAX_TOPPING = 5;

  Topping topping;
  RowItemCheckbox(this.topping);

  @override
  State<RowItemCheckbox> createState() => _RowItemCheckbox();
}

class _RowItemCheckbox extends State<RowItemCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };

      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }
    return Container(
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Text(widget.topping.name, style: TextStyle(fontWeight: FontWeight.w500),),
                    Text('${widget.topping.price.toString()}đ')
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              )
          ),
          Checkbox(
            checkColor: Colors.white,
            // fillColor: MaterialStateProperty.resolveWith(getColor),
            // fillColor: Colors.green,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value!;
              });
            },
          )
        ],
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFDADADAD))
        )
      ),
    );
  }
}
