import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? icon,
  }) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 2)),
        hintText: hintText,
        labelText: labelText,
        counterText: "",
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: icon != null
            ? Icon(
                icon,
              )
            : null);
  }
}
