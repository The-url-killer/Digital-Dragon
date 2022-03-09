import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/input.dart';
import 'package:digital_dragon_v1/ui/components/link.dart';
import 'package:digital_dragon_v1/ui/components/solid_button.dart';
import 'package:flutter/material.dart';
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

  static const TextStyle titleStyle = TextStyle(
    fontSize: FontSize.kFontSize36,
    fontWeight: FontWeight.w700,
    color: ColorsApp.kPrimaryColor,
  );

  @override
  Widget build(BuildContext context) {
    double paddingBootom = Sizes.heigth(context) * 0.1;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40, bottom: paddingBootom),
              child: const Center(child: Text("Cadastrar", style: titleStyle)),
            ),
            Input(controller: userController, hint: "Usuário:"),
            Input(controller: emailController, hint: "E-mail:"),
            Input(controller: passController, hint: "Senha:"),
            Input(controller: passConfirmController, hint: "Confirmar Senha:"),
            const SizedBox(height: 40),
            Link(
              content: "Já tenho uma conta",
              onClick: handleClickHaveAccount,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SolidButton(
                "Cadastrar e entrar",
                ColorsApp.kBlack,
                ColorsApp.kWhite,
                handleClickSignUp,
                TypeButton.solid,
              ),
            )
          ],
        ),
      ),
    );
  }
}
