import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, required this.starCount});
  final int starCount ;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for(var i =5; i>0; i--)
          i<=starCount ? Icon(Icons.star, color: Colors.amber,size: 20,) :
        Icon(Icons.star_border_outlined, color: Colors.black26,size: 20,),
      ],
    );
  }
}