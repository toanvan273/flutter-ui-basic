
import 'package:flutter/material.dart';
import 'package:flutter_ui/view/movie/detail_screen.dart';

class ShowItem extends StatelessWidget {
  const ShowItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Container(
            child: Column(
              children: const [
                Text("TITLE NHA"),
                Text('Geners: ....'),
                Text('Cast: ....')
              ],
            ),
          )
        ],
      ),
      padding: EdgeInsets.only(bottom: 10),
    );
  }
}
