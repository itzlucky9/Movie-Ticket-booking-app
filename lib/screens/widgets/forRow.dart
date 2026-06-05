import 'package:flutter/material.dart';

Widget ForRow(String text, Color clr){
  return Row(
    children: [
      Container(
        decoration: BoxDecoration(
          // color: clr,
          shape: BoxShape.circle,
          border: Border.all(color: clr,width: 4)
        ),
      ),

      SizedBox(width: 8,),

      Text(
        text,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 14
        ),
      )
    ],
  );
}