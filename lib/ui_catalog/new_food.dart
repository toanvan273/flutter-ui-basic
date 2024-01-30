import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_bloc.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_event.dart';
import 'package:flutter_ui/ui_catalog/blocs/drink_state.dart';

class AddNewFood extends StatefulWidget{
  Product product;
  AddNewFood(this.product, {super.key});

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
                      ),
                      InkWell(
                        child: Icon(Icons.open_in_browser),
                        onTap: (){

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
              onPressed: (){
                context.read<DrinkBloc>().add(DrinkAddOrderEvent());
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.deepOrangeAccent
              ),
              child: Text('Thêm vào giỏ hàng 1000 \$'),
            ),
          )
        ],
      ),
    );
  }
}

class MyDrink extends StatefulWidget{
  Product product;
  MyDrink(this.product);

  @override
  State<StatefulWidget> createState() {
    return _MyDrink();
  }
}

class _MyDrink extends State<MyDrink>{
  int localQuantity = 0;

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.product.name , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                            Text('${widget.product.price*0.9}đ', style: TextStyle(color: Colors.black, fontSize: 14)),
                            SizedBox(width: 5),
                            Text('${widget.product.price}đ', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),)
                          ],
                        ),
                      ),
                      BlocBuilder<DrinkBloc, DrinkState>(
                        builder: (context, state){
                          return Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    int quantity = localQuantity==0?0:localQuantity-1;
                                    context.read<DrinkBloc>().add(DrinkAddEvent(product: widget.product, quantity: quantity));
                                    setState(() {
                                      localQuantity = quantity;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      border: Border.all(
                                        color:  Colors.deepOrange,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Icon(Icons.remove,color: Colors.deepOrange),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('$localQuantity'),
                                ),
                                InkWell(
                                  onTap: (){
                                    context.read<DrinkBloc>().add(DrinkAddEvent(product: widget.product, quantity: localQuantity+1));
                                    setState(() {
                                      localQuantity = localQuantity+1;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: Colors.deepOrange,
                                      border: Border.all(
                                        color:  Colors.deepOrange,
                                        style: BorderStyle.solid,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Icon(Icons.add, color: Colors.white,),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
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
    return BlocBuilder<DrinkBloc, DrinkState>(
      builder: (context, state){
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
              RowItemCheckbox(topping, widget.product),
            FractionallySizedBox(
              widthFactor: 1,
              child:  Container(
                // margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.grey,
                child: Text('MỨC ĐƯỜNG (Sugar, toi da 1)'),
              ),
            ),
            for(final sugar in sugarList)
              RowSugarCheckbox(sugar,'Đường', widget.product),
            FractionallySizedBox(
              widthFactor: 1,
              child:  Container(
                // margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.grey,
                child: Text('MỨC ĐÁ (ICE, toi da 1)'),
              ),
            ),
            for(final sugar in sugarList)
              RowSugarCheckbox(sugar,'Đá', widget.product),
            MyNote(widget.product)
          ],
        );
      },
    );

  }
}

class MyNote extends StatelessWidget {
  Product product;

  MyNote(this.product);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 5),
      child: InkWell(
        onTap: (){
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5)
                  )
              ),
              builder: (context){
                return FractionallySizedBox(
                  heightFactor: 0.6,
                  child: TextNoteCustomer(product),
                );
              }
          );
        },
        child: const Row(
          children: [
            Icon(Icons.note_add),
            Padding(padding: EdgeInsets.all(5)),
            Text('Ghi chú...')
          ],
        ),
      ),
    );
  }
}

class TextNoteCustomer extends StatefulWidget{
  Product product;

  TextNoteCustomer(this.product);

  @override
  State<StatefulWidget> createState() {
    return _TextNoteCustomer();
  }
}

class _TextNoteCustomer extends State<TextNoteCustomer>{
  late TextEditingController _controller;
  String note = '';
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Hủy'),
                ),
                Expanded(
                  child: Center(child: Text('Thêm ghi chú')),
                ),
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text('Xong'),
                )
              ],
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              // obscureText: true,
              controller: _controller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Ghi chú dành cho quán',
              ),
              onChanged: (v){
                context.read<DrinkBloc>().add(DrinkAddEvent(product: widget.product, note: v));
                setState(() {
                  note = v;
                });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Column(
                children: [
                  Text('Gợi ý'),
                  Text('Abc')
                ],
              ),
              Expanded(child: SizedBox()),
              Text('${note.length}/100')
            ],),
          )
        ],
      ),
    );
  }
}

class RowSugarCheckbox extends StatefulWidget {
  final MAX_TOPPING = 1;
  Sugar sugar;
  String type;
  Product product;

  RowSugarCheckbox(this.sugar, this.type, this.product);

  @override
  State<RowSugarCheckbox> createState() => _RowSugarCheckbox();
}

class _RowSugarCheckbox extends State<RowSugarCheckbox>{
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Color(0xFDADADAD))
          )
      ),
      child: Row(
        children: [
          Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${(widget.sugar.level*100).toInt()}% ${widget.type}', style: TextStyle(fontWeight: FontWeight.w500),),
                    Text('${widget.sugar.price.toString()}đ')
                  ],
                ),
              )
          ),
          Checkbox(
            checkColor: Colors.white,
            value: isChecked,
            onChanged: (bool? value) {
              if(value!){
                print(value);
                context.read<DrinkBloc>().add(DrinkAddEvent(product: widget.product, sugar: widget.sugar.level));
              }
              setState(() {
                isChecked = value!;
              });
            },
          )
        ],
      ),
    );
  }
}


class RowItemCheckbox extends StatefulWidget {
  final MAX_TOPPING = 5;
  Topping topping;
  Product product;
  RowItemCheckbox(this.topping, this.product);

  @override
  State<RowItemCheckbox> createState() => _RowItemCheckbox();
}

class _RowItemCheckbox extends State<RowItemCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFDADADAD))
        )
      ),
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
            // fillColor: Colors.green,
            value: isChecked,
            onChanged: (bool? value) {
              if(value!){
                context.read<DrinkBloc>().add(DrinkAddEvent(product: widget.product, topping: widget.topping));
              }
              setState(() {
                isChecked = value!;
              });
            },
          )
        ],
      ),
    );
  }
}
