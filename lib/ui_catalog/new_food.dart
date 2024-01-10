import 'package:flutter/material.dart';

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
                        child: Column(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text('Tra Chanh Gia Tay', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  Row(
                                    children: [
                                      Text('717 da ban', style: TextStyle(color: Colors.black45, fontSize: 16),),
                                      Divider(),
                                      Text('7 Luot thich', style: TextStyle(color: Colors.black45, fontSize: 16))
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Row(children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Text('40,000d', style: TextStyle(color: Colors.black, fontSize: 16)),
                                    Text('38,000d', style: TextStyle(fontSize: 18, color: Colors.deepOrangeAccent),)
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
                                          borderRadius: BorderRadius.circular(5),

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
                                          borderRadius: BorderRadius.circular(5),
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
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Column(),
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