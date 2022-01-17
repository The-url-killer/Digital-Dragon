import 'package:digital_dragon_v1/components/solid_button.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/hooks/use-user.hook.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  FocusNode inputFocus = FocusNode();

  @override
  void initState() {
    setState(() {
      inputFocus.addListener(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    inputFocus.dispose();
    super.dispose();
  }

  void handleClick() {
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    final double containerWidth = Sizes.width(context) * 0.80;
    final double containerHeigth = Sizes.heigth(context) * 1.04;
    final double buttonWidth = Sizes.width(context);

    const double radius = 23;
    const double borderWidth = 1;
    const double marginToTop = 35;
    const String textTitle = "Entrar";
    const userLabel = "Usuario";
    const passLabel = "Senha";
    const textButton = "Esqueci minha senha";

    const TextStyle textStyleTitle = TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: FontSize.kFontSize36,
      color: ColorsApp.kPrimaryColor,
      fontWeight: FontWeight.w700,
    );

    const TextStyle textStyleLabelDisabled = TextStyle(
      fontFamily: 'Ubuntu',
      fontSize: FontSize.kFontSize14,
      color: ColorsApp.kBlack,
      fontWeight: FontWeight.w300,
    );

    const TextStyle textStyleLableEnabled = TextStyle(
        fontFamily: 'Ubuntu',
        color: ColorsApp.kPrimaryColor,
        fontSize: FontSize.kFontSize14,
        fontWeight: FontWeight.w300);

    const focusedInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: ColorsApp.kPrimaryColor));

    const TextStyle textInputStyle = TextStyle(
        fontFamily: 'Ubuntu',
        color: ColorsApp.kPrimaryColor,
        fontSize: FontSize.kFontSize18,
        fontWeight: FontWeight.w300);

    RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
        side: const BorderSide(
            color: ColorsApp.kBlackBorder, width: borderWidth));

    return Scaffold(
      body: Center(
        child: Card(
          shape: roundedRectangleBorder,
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
                  const SizedBox(height: marginToTop),
                  Column(
                    children: [
                      TextFormField(
                        controller: userController,
                        style: textInputStyle,
                        focusNode: inputFocus,
                        onTap: () {
                          FocusScope.of(context).requestFocus(inputFocus);
                        },
                        decoration: InputDecoration(
                            labelText: userLabel,
                            labelStyle: inputFocus.hasFocus
                                ? textStyleLableEnabled
                                : textStyleLabelDisabled,
                            focusedBorder: focusedInputBorder),
                      ),
                      TextFormField(
                        controller: passController,
                        style: textInputStyle,
                        onTap: () {
                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          labelText: passLabel,
                          labelStyle: !inputFocus.hasFocus
                              ? textStyleLableEnabled
                              : textStyleLabelDisabled,
                          focusedBorder: focusedInputBorder,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: buttonWidth,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            textButton,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontSize: FontSize.kFontSize14,
                              fontWeight: FontWeight.w700,
                              color: ColorsApp.kPrimaryColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SolidButton("Entrar", ColorsApp.kBlack, ColorsApp.kWhite,
                          handleClick),
                      const SizedBox(height: 12),
                      SolidButton("Cadastrar", ColorsApp.kWhite,
                          ColorsApp.kBlack, () {})
                    ],
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
