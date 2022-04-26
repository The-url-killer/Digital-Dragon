// ignore_for_file: must_be_immutable

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/material.dart';

class Anotations extends StatefulWidget {
  Anotations({Key? key, required this.anotations}) : super(key: key);

  List<dynamic> anotations;

  @override
  State<Anotations> createState() => _AnotationsState();
}

class _AnotationsState extends State<Anotations> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: Sizes.width(context) * 0.05),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: widget.anotations
              .map((anotation) => Container(
                    width: Sizes.width(context) * 0.9,
                    padding: const EdgeInsets.fromLTRB(12, 20, 20, 20),
                    margin: const EdgeInsets.only(bottom: 20),
                    constraints: const BoxConstraints(minHeight: 100),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: ColorsApp.kBlack,
                        width: 1,
                      ),
                    ),
                    child: Text(
                      anotation,
                      style: const TextStyle(fontSize: FontSize.kFontSize16),
                    ),
                  ))
              .toList()),
    );
  }
}
