import 'package:flutter/material.dart';
import 'package:flutter_ui/ui_catalog/Product.dart';

class AddNewFood extends StatelessWidget{
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
                Container(
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                    Text('Tra Chanh Gia Tay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                    Row(
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
                                      Text('40,000d', style: TextStyle(color: Colors.black, fontSize: 14)),
                                      SizedBox(width: 5),
                                      Text('38,000d', style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent),)
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
                                      Padding(
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
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: MyTopping(),
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

class MyTopping extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyTopping();
  }
}
class _MyTopping extends State<MyTopping>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('TOPPING (Topping, toi da 5)'),
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
