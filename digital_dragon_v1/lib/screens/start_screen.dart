import 'dart:math';

import 'package:digital_dragon_v1/components/solid_button.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double paddingSize = 12;
    const double paddingToText = 30;
    const String titleText = 'Bem vindo ao DD';
    const String descriptionText =
        'O DD é um aplicativo de D&D, que lhe dá a maior facilidade ao jogar.';
    double maxWidthToWrap = Sizes.width(context) * 0.95;

    const TextStyle descriptionTextStyle = TextStyle(
      color: ColorsApp.kLightPurple,
      fontFamily: 'Ubuntu',
      fontSize: FontSize.kFontSize18,
    );

    const TextStyle titleTextStyle = TextStyle(
      color: ColorsApp.kWhite,
      fontFamily: 'Ubuntu',
      fontSize: FontSize.kFontSize36,
    );

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          FittedBox(
            child: Image.asset(
              'assets/images/start_background.png',
            ),
            fit: BoxFit.fill,
          ),
          Container(
            width: Sizes.width(context),
            height: Sizes.heigth(context),
            color: ColorsApp.kOverlayStart,
          ),
          Padding(
            padding: const EdgeInsets.all(paddingSize),
            child: SizedBox(
                width: Sizes.width(context),
                height: Sizes.heigth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidthToWrap),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            titleText,
                            style: titleTextStyle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: maxWidthToWrap),
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            descriptionText,
                            style: descriptionTextStyle,
                          ),
                        ),
                      ),
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(top: paddingToText),
                      child: SolidButton(
                        "Entrar",
                        ColorsApp.kPrimaryColor,
                        ColorsApp.kWhite,
                        key: const Key("loginButton"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: paddingSize),
                      child: SolidButton(
                          "Registrar-se", ColorsApp.kWhite, ColorsApp.kBlack,
                          key: const Key("registerButton")),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
