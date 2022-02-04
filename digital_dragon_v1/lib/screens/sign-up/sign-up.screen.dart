import 'package:flutter/material.dart';
import 'package:digital_dragon_v1/components/solid_button.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/hooks/use-user.hook.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController userController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController passConfirmController = TextEditingController();

  handleClickSignUp() {
    var response = signUp(
        name: userController.text,
        email: emailController.text,
        password: passController.text);

    response.then((value) => {globals.email = value});
    Navigator.of(context).pushNamed(Routes.createCampaign);
  }

  handleClickHaveAccount() {
    Navigator.of(context).pushNamed(Routes.signIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(controller: userController),
          TextFormField(controller: emailController),
          TextFormField(controller: passController),
          TextFormField(controller: passConfirmController),
          const SizedBox(height: 20),
          SolidButton("Já tenho uma conta", ColorsApp.kBlack, ColorsApp.kWhite,
              handleClickHaveAccount),
          const SizedBox(height: 12),
          SolidButton("Cadastrar e entrar", ColorsApp.kWhite, ColorsApp.kBlack,
              handleClickSignUp)
        ],
      ),
    );
  }
}
