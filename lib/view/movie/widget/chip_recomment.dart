import 'package:flutter/material.dart';

class ChipRecomment extends StatelessWidget {
  String recomment;
  ChipRecomment({
    super.key,
    required this.recomment
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Chip(label: Text(recomment)),
    );
  }
}
