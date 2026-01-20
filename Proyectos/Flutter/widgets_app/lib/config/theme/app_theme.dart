import 'package:flutter/material.dart';

  const colorList=<Color>[
    Colors.blue,
    Color.fromARGB(255, 186, 81, 116),
    Colors.grey,
    Colors.yellow,
    Colors.purple,
    Colors.green,
    Colors.pinkAccent,
    Colors.tealAccent
    
  ];

class AppTheme {



  final int selectedColor;

  AppTheme({this.selectedColor=0}):
  assert(selectedColor>=0, 'selected color must be greater than 0'),
  assert(selectedColor < colorList.length, 'selected color must be less or equal than ${colorList.length-1}');

  ThemeData getTheme()=>ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    appBarTheme: AppBarTheme(
      centerTitle: false,
    )
  );

}