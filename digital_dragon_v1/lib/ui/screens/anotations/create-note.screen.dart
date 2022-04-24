import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/hooks/user-campaing.hook.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatefulWidget {
  CreateNote({Key? key, required this.id, required this.type})
      : super(key: key);

  String id;
  String type;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  TextEditingController loreController = TextEditingController();

  handleClick() async {
    await createNote(
        text: loreController.text, id: widget.id, type: widget.type);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            left: 15,
            top: 15,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: ColorsApp.kPrimaryColor,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          SizedBox(
            width: Sizes.width(context),
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Crie uma nota",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: FontSize.kFontSize36,
                    color: ColorsApp.kPrimaryColor,
                  ),
                ),
                SizedBox(
                  width: Sizes.width(context),
                  height: 80,
                ),
                TextFormField(
                  controller: loreController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: ColorsApp.kBlack, width: 1),
                      ),
                      hintText: 'Nos conte sobre a sua campanha',
                      hintStyle: TextStyle(color: ColorsApp.kPrimaryColor)),
                ),
                SizedBox(height: Sizes.heigth(context) * .1),
                SolidButton("Salvar", ColorsApp.kPrimaryColor, ColorsApp.kWhite,
                    handleClick, "solid")
              ],
            ),
          )
        ],
      ),
    );
  }
}
