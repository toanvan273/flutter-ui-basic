import 'package:flutter/material.dart';
import 'package:flutter_ui/view/movie/widget/chip_recomment.dart';
import 'package:flutter_ui/view/movie/widget/movie_item.dart';
import 'package:flutter_ui/view/movie/widget/show_item.dart';

class HomeMovie extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
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
                height: 50,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ChipRecomment(recomment: 'For you',),
                    ChipRecomment(recomment: 'Top chart',),
                    ChipRecomment(recomment: 'CATEGORY',),
                    ChipRecomment(recomment: 'For you',),
                    ChipRecomment(recomment: 'For you',),
                    ChipRecomment(recomment: 'For you',),
                    ChipRecomment(recomment: 'For you',),
                  ],
                )
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text(
                    'Recommeneded For You',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Container(
                height: 160,
                padding: EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                    MovieItem(),
                  ],
                )
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  child: Text('TV Show', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
                ),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(10),
                  children: [
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
                    ShowItem(),
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

