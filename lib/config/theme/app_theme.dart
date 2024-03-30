import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFFFFFFF);

const List<Color> _colorScheme=[
  _customColor,
  Colors.pinkAccent,
  Colors.amber,
  Colors.purple,
];

class AppTheme{

  int selectedColor;

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorScheme.length,
            'El número debe ser menor a : ${_colorScheme.length}');

  ThemeData theme (){
    return ThemeData(useMaterial3: true, colorSchemeSeed: _colorScheme[selectedColor],brightness: Brightness.dark);
  }
}