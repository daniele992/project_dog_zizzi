import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogCustomLabelText  extends StatelessWidget{
  final String label;
  final String value;
  final Color color;
  final double subTitleSize;

  const DogCustomLabelText({
    super.key,
    required this.label,
    required this.value,
    this.color = Colors.blueAccent,
    this.subTitleSize = 18,
  });

  @override
  Widget build(BuildContext context){
    return RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style,
        children: [
          TextSpan(
            text: "$label: ",
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: subTitleSize,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(fontSize:subTitleSize)
          )
        ]
      )
    );
  }


}