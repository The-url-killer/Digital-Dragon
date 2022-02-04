import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:digital_dragon_v1/components/solid_button.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/hooks/use-user.hook.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  handleClick() {
    var response =
        login(email: userController.text, password: passController.text);
    response.then((value) => {globals.email = value});
    Navigator.of(context).pushNamed(Routes.createCampaign);
  }

  handleClickDontHaveAccount() {
    Navigator.of(context).pushNamed(Routes.signUp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: userController),
          TextFormField(controller: passController),
          const SizedBox(height: 20),
          SolidButton(
              "Entrar", ColorsApp.kBlack, ColorsApp.kWhite, handleClick),
          const SizedBox(height: 12),
          SolidButton("Cadastrar", ColorsApp.kWhite, ColorsApp.kBlack,
              handleClickDontHaveAccount)
        ],
      ),
    );
  }
}
