
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/movie/detail_screen.dart';

class ShowItem extends StatelessWidget {
  const ShowItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailMovie()
              ));
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'asset/images/view.jpeg',
                height: 140,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Flexible(
                child: Wrap(
                  direction: Axis.vertical,
                  textDirection: TextDirection.ltr,
                  children:  [
                    Row(children: [
                      Text("TITLE NHA", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),),
                      SizedBox(width: 10,),
                      Row(children: [
                        Icon(Icons.star_outlined, color: Colors.yellow, size: 16,),
                        Icon(Icons.star_outlined, color: Colors.yellow, size: 16,),
                        Icon(Icons.star_outlined, color: Colors.yellow, size: 16,),
                        Icon(Icons.star_outlined, color: Colors.yellow, size: 16,),
                        Icon(Icons.star_outlined, color: Colors.yellow, size: 16,)
                      ],)
                    ],),
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                        text: 'Geners: ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: 'Sci-Fi Tv, Tv Action, & Adventure.', style: TextStyle(color: Colors.white))
                        ]
                    )),
                    SizedBox(height: 5,),
                    RichText(
                      overflow: TextOverflow.visible,
                        text: TextSpan(
                        text: 'Cast: ',
                        style: TextStyle(color: Colors.grey),
                        children: [
                          TextSpan(text: 'Grant Gustin, Candice Patton, Danielle Panabaker.', style: TextStyle(color: Colors.white))
                        ]
                    )),
                  ],
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
