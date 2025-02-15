import 'package:flutter/material.dart';
import 'package:noteapp2/Shared/Theem/app_fonts.dart';

fild(
    {required TextEditingController controller,
    required String label,
    bool issecure = false,
    required TextInputType textInputType,
    required TextInputAction textInputAction,
    bool isEnabled = true}) {
  return Padding(
    padding: const EdgeInsets.only(right: 25.0, left: 10.0),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        errorBorder: _inputBorder(Colors.red),
        labelText: label,
        labelStyle: AppFonts.normalPrimaryDarck,
      ),
      obscureText: issecure,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      enabled: isEnabled,
    ),
  );
}

OutlineInputBorder _inputBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: color, width: 0.5));
}
