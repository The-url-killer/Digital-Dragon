import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _userController;
  late TextEditingController _passController;

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _passController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final double containerWidth = Sizes.width(context) * 0.80;
    final double containerHeigth = Sizes.heigth(context);

    const double radius = 23;
    const double borderWidth = 1;
    const String textTitle = "Entrar";
    const userLabel = "Usuario";
    const passLabel = "Senha";

    const TextStyle textStyleTitle = TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: FontSize.kFontSize36,
      color: ColorsApp.kPrimaryColor,
      fontWeight: FontWeight.w700,
    );

    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: const BorderSide(
                  color: ColorsApp.kBlackBorder, width: borderWidth)),
          child: SizedBox(
            width: containerWidth,
            height: containerHeigth,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    textTitle,
                    style: textStyleTitle,
                    textAlign: TextAlign.center,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _userController,
                          decoration: const InputDecoration(
                            labelText: userLabel,
                          ),
                        ),
                        TextFormField(
                          controller: _passController,
                          decoration: const InputDecoration(
                            labelText: passLabel,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
