
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/movie/detail_screen.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailMovie()
        ));
      },
      child: Container(
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
    );
  }
}