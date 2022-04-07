import 'dart:developer';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CreateButton extends StatelessWidget {
  const CreateButton({Key? key, required this.navigateTo}) : super(key: key);

  final String navigateTo;

  @override
  Widget build(BuildContext context) {
    void onPressed() {
      switch (navigateTo) {
        case 'campaign':
          Navigator.of(context).pushNamed(Routes.createCampaign);
          break;
        case 'character':
          Navigator.of(context).pushNamed(Routes.createCharacter);
          break;
        default:
          break;
      }
    }

    double size = Sizes.width(context) * .25;
    BorderRadius borderRadius =
        BorderRadius.circular(Sizes.width(context) * .13);

    return Material(
      borderRadius: borderRadius,
      child: Ink(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: ColorsApp.kPrimaryColor,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: borderRadius,
          child: const Icon(Icons.add, size: 60, color: ColorsApp.kWhite),
        ),
      ),
    );
  }
}
