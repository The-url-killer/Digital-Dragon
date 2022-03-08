import 'dart:developer';

import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/input.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Input(controller: userController, hint: "Usuario:"),
            Input(controller: passController, hint: "Senha:"),
            const SizedBox(height: 20),
            SolidButton(
              "Entrar",
              ColorsApp.kBlack,
              ColorsApp.kWhite,
              handleClick,
              TypeButton.solid,
            ),
            const SizedBox(height: 12),
            SolidButton(
              "Cadastrar",
              ColorsApp.kWhite,
              ColorsApp.kPrimaryColor,
              handleClickDontHaveAccount,
              TypeButton.transparent,
            )
          ],
        ),
      ),
    );
  }
}
