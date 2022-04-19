// ignore_for_file: prefer_initializing_formals, must_be_immutable

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input({Key? key, required controller, required String hint, this.password = false})
      : controller = controller,
        hint = hint,
        super(key: key);

  TextEditingController controller;
  String hint;
  bool password;

  late dynamic style = InputDecoration(
    hintText: hint,
    hintStyle: const TextStyle(
      color: ColorsApp.kBlack,
      fontSize: FontSize.kFontSize14,
    ),
    focusedBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorsApp.kPrimaryColor, width: 2.0),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: ColorsApp.kBlack, width: 1.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: style,
      obscureText: password,
    );
  }
}
