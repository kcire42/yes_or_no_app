import 'package:flutter/material.dart';

//const Color _customcolor = Color(0xFFDB6204);

const List<Color> _customColors = [
  Color(0xFF6200EE), // Purple
  Color(0xFFDA0303), // Teal
  Color(0xFFFF5722), // Deep Orange
  Color(0xFF9C27B0), // Purple
  Color(0xFF2196F3), // Blue
];

const List<Brightness> _custombrightness = [Brightness.light, Brightness.dark];

class AppTheme {
  final int selectedColorIndex;
  final int selectedBrightnessIndex;

  AppTheme(this.selectedColorIndex, this.selectedBrightnessIndex) {
    if (selectedColorIndex < 0 || selectedColorIndex >= _customColors.length) {
      throw ArgumentError(
        'selectedColorIndex must be between 0 and ${_customColors.length - 1}',
      );
    }
    if (selectedBrightnessIndex < 0 ||
        selectedBrightnessIndex >= _custombrightness.length) {
      throw ArgumentError(
        'selectedBrightnessIndex must be between 0 and ${_custombrightness.length - 1}',
      );
    }
  }

  ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _customColors[selectedColorIndex],
      brightness: _custombrightness[selectedBrightnessIndex],
    );
  }
}
