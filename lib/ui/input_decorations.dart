import 'package:banipay_comercial/theme/colors.dart';
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
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: icon != null
            ? Icon(
          icon,
        )
            : null);
  }


  static InputDecoration createInputDecoration({
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
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: icon != null
            ? Icon(
          icon,color: royalPurple,
        )
            : null);
  }
}
