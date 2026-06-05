import 'package:flutter/material.dart';

Widget DatesCard(dynamic item, bool isSelected){
  
  return Ink(
    width: 55,
    height: 70.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: isSelected ?Colors.cyanAccent  : Color(0xff2F255F),

      border: Border.all(
        color: Colors.cyanAccent,
        width: 1,
      )
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item["date"],
          style: TextStyle(
            color: Colors.white70,
          ),
        ),

        Text(
          item["day"],
          style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        )
      ],
    ),
  );
}