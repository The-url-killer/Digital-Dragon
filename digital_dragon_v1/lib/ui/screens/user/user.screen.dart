import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/user-data.model.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';

import 'package:digital_dragon_v1/context/globals.dart' as globals;

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: Sizes.width(context), height: 1),
          Positioned(
            left: 30,
            top: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: ColorsApp.kPrimaryColor,
                size: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  height: 250,
                  width: 250,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(125),
                    child: Image.network(
                      globals.userData.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Text(
                  globals.userData.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: FontSize.kFontSize48,
                      color: ColorsApp.kGreyBlack),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SolidButton(
                      "Editar perfil",
                      Colors.transparent,
                      ColorsApp.kPrimaryColor,
                      () {},
                      "transparent",
                    ),
                    SolidButton(
                      "Sair",
                      Colors.transparent,
                      Colors.red,
                      () {
                        Navigator.pushNamed(context, Routes.start);
                        globals.userData =
                            UserData(email: "", name: "", image: "");
                      },
                      "transparent",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
