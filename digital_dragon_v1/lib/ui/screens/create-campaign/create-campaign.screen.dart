import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';
import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/context/globals.dart' as globals;

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({Key? key}) : super(key: key);

  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController loreController = TextEditingController();

  handleClick() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(globals.email),
          TextFormField(controller: imageController),
          TextFormField(controller: nameController),
          TextFormField(controller: loreController),
          const SizedBox(height: 20),
          SolidButton(
            "Criar",
            ColorsApp.kBlack,
            ColorsApp.kWhite,
            handleClick,
            TypeButton.solid,
          ),
        ],
      ),
    );
  }
}
