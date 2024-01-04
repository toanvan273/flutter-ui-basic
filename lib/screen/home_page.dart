import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: Container(
          child: Column(
            children: [
             SizedBox(
                child: Image.asset(
                  'asset/images/view.jpeg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Osechinen Lake Campground',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  Text('Kandersteg, Switzerland', textAlign: TextAlign.start,)
                                ],
                              ),
                            ),
                          ),
                          const Row(
                            children: [
                              Icon(Icons.star, color: Colors.redAccent,),
                              Text('41')
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(child: Column(
                              children: [
                                Icon(Icons.call, color: Colors.green, size: 35),
                                Text('CALL')
                              ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Icon(Icons.directions, color: Colors.green, size: 35),
                                Text('ROUTE')
                              ],
                            )),
                            Expanded(child: Column(
                              children: [
                                Icon(Icons.share, color: Colors.green, size: 35),
                                Text('SHARE')
                              ],
                            ))
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        child: Text('Wild camping is prohibited in the entire region Oeschinensee . A ranger is out and about in the area every day, including in the evenings, to inform guests.'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}