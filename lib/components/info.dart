import 'package:flutter/material.dart';
class Info extends StatelessWidget {
  IconData? icon;
  String text ;
  double? fontSize;
  Color? fontColor;

  Info({required this.icon, required this.text,this.fontSize,this.fontColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(icon,
          color: Colors.grey,),
        SizedBox(width: 15,),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(text,
            style: TextStyle(
            color:fontColor?? Colors.grey,
            fontSize: fontSize?? 25,
                fontWeight: FontWeight.bold,
          ),),
        ),
      ],
    );
  }
}
