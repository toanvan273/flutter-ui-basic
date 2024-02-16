import 'package:flutter/material.dart';

class DetailMovie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Text('Detail Movie'),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Text('Content'),
            )
          ],
        ),
      ),
    );
  }
}