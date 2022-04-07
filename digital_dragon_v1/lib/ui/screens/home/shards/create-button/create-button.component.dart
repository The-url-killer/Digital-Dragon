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
          Navigator.of(context).pushNamed(Routes.campaign);
          break;
        case 'character':
          Navigator.of(context).pushNamed(Routes.character);
          break;
        default:
          break;
      }
    }

    return Container(
      width: Sizes.width(context) * .25,
      height: Sizes.width(context) * .25,
      decoration: BoxDecoration(
        color: ColorsApp.kPrimaryColor,
        borderRadius: BorderRadius.circular(Sizes.width(context) * .13),
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.add, size: 60, color: ColorsApp.kWhite)),
    );
  }
}
