import 'package:flutter/material.dart';

Widget TimeCard(dynamic item, bool selectedTime){
  
  return Ink(
    width: 55,
    height: 60,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: selectedTime ? Colors.cyanAccent : Color(0xff2F255F),

      border: Border.all(
        color: Colors.cyanAccent,
        width: 1,
      )
    ),

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          item,
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    ),
  );
}