import 'dart:math';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/ui/resources/dice_icon_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dices extends StatefulWidget {
  const Dices({Key? key}) : super(key: key);

  @override
  State<Dices> createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  List<int> dicesType = [4, 6, 8, 12, 20, 100];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      padding: const EdgeInsets.all(20),
      crossAxisCount: 2,
      children: renderDices(),
    );
  }

  void showAlertDialog(BuildContext context, int value) {
    int response = Random().nextInt(value) + 1;

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          return CupertinoAlertDialog(
            title: const Text("Resultado"),
            content: Text(response.toString()),
            actions: [
              CupertinoDialogAction(
                child: const Text("Ok"),
                onPressed: () {
                  Navigator.pop(
                    context,
                  );
                },
              )
            ],
          );
        });
  }

  List<Widget> renderDices() => dicesType
      .map(
        (diceType) => Material(
          child: Ink(
            child: InkWell(
              onTap: () {
                showAlertDialog(context, diceType);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: ColorsApp.kBlack,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(
                        DiceIcon.dice_icon,
                        size: 90,
                        color: ColorsApp.kPrimaryColor,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "D " + diceType.toString(),
                        style: const TextStyle(fontSize: FontSize.kFontSize24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
      .toList();
}
