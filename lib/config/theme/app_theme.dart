import 'package:flutter/material.dart';

const Color _customColor = Color.fromARGB(255, 155, 50, 50);
const List<Color> _colorThemes = [ 
  _customColor,
  Colors.amber,
  Colors.orange,
  Colors.blue,
  Colors.lightBlue
];


class AppTheme {

    final int selectedColor;

    AppTheme({this.selectedColor = 0})
      :assert(selectedColor >= 0 && selectedColor < _colorThemes.length - 1, 
      'selectedColor must be between 0 and ${_colorThemes.length - 1}')
      ;


  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark
      );
  }
}
