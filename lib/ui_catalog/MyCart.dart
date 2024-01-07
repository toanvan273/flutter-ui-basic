import 'package:flutter/material.dart';

class MyCart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
      ),
      body: Center(
        child: Text('Hello My cart'),
      ),
      // body: ListView(
      //   children: const [
      //     Row(
      //       children: [
      //         ListTile(
      //           title: Text('Title'),
      //           leading: Text('Price'),
      //         ),
      //         ElevatedButton(onPressed: null, child: Text('Action'))
      //       ],
      //     ),
      //
      //
      //   ],
      // ),
    );
  }
}