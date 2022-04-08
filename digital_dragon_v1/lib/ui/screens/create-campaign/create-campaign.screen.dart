import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/input-no-border/input-no-border.component.dart';
import 'package:digital_dragon_v1/ui/components/input.component.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';

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

  var boxDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: ColorsApp.kGrey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: boxDecoration,
              height: Sizes.heigth(context) * .3,
              width: Sizes.width(context) * .6,
              child: const Icon(Icons.image,
                  size: 100, color: ColorsApp.kPrimaryColor),
            ),
            SizedBox(height: Sizes.heigth(context) * .1),
            InputNoBorder(
                controller: nameController, hint: 'Digite o nome da campanha'),
            TextFormField(
              controller: loreController,
              maxLines: 10,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(color: ColorsApp.kBlack, width: 1),
                  ),
                  hintText: 'Nos conte sobre  a  sua campanha',
                  hintStyle: TextStyle(color: ColorsApp.kPrimaryColor)),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: Sizes.width(context) * .4,
              child: SolidButton("Finish", ColorsApp.kPrimaryColor, ColorsApp.kWhite,
                  handleClick, TypeButton.solid),
            ),
          ],
        ),
      ),
    );
  }
}
