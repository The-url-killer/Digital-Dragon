import 'dart:developer';

import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/input.dart';
import 'package:digital_dragon_v1/ui/components/link.dart';
import 'package:digital_dragon_v1/ui/components/solid_button.dart';
import 'package:flutter/material.dart';
import 'package:digital_dragon_v1/constants/colors.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  handleClick() {
    log(userController.text);
    // var response =
    //     login(email: userController.text, password: passController.text);
    // response.then((value) => {globals.email = value});
    // Navigator.of(context).pushNamed(Routes.createCampaign);
  }

  handleClickDontHaveAccount() {
    Navigator.of(context).pushNamed(Routes.signUp);
  }

  handleClickLink() {}

  static const TextStyle titleStyle = TextStyle(
    fontSize: FontSize.kFontSize36,
    fontWeight: FontWeight.w700,
    color: ColorsApp.kPrimaryColor,
  );

  @override
  Widget build(BuildContext context) {
    double paddingBootom = Sizes.heigth(context) * 0.2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: paddingBootom),
              child: const Center(child: Text("Entrar", style: titleStyle)),
            ),
            Input(controller: userController, hint: "Usuario:"),
            Input(controller: passController, hint: "Senha:"),
            const SizedBox(height: 45),
            Link(content: "Esqueci minha senha", onClick: handleClickLink),
            const SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SolidButton(
                "Entrar",
                ColorsApp.kBlack,
                ColorsApp.kWhite,
                handleClick,
                TypeButton.solid,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Link(
                  content: "Criar conta",
                  onClick: handleClickDontHaveAccount,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
