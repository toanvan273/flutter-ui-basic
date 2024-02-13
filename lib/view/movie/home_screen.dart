import 'package:flutter/material.dart';

class HomeMovie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        // width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.redAccent,
                Colors.black87,
              ],
            )
        ),
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 10),
                        child: const TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                                labelText: 'Search Your Movie Here!',
                                border: UnderlineInputBorder()
                            )
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset(
                        'asset/images/view.jpeg',
                        height: 60,
                        width: 60,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 50,  ///assumed
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    Chip(label: Text('For you')),
                    Chip(label: Text('Top Charts')),
                    Chip(label: Text('CATEGORY')),
                    Chip(label: Text('For you')),
                    Chip(label: Text('Top Charts')),
                    Chip(label: Text('CATEGORY')),
                    Chip(label: Text('For you')),
                    Chip(label: Text('Top Charts')),
                    Chip(label: Text('CATEGORY')),
                  ],
                )
              ),
              Text('Recommeneded For You'),
              Container(
                height: 160,
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                    Container(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text('Title movie'),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(right: 10),
                    ),
                  ],
                )
              ),
              Text('TV Show'),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                    Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'asset/images/view.jpeg',
                              height: 140,
                              width: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text("TITLE NHA"),
                                Text('Geners: ....'),
                                Text('Cast: ....')
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.only(bottom: 10),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}