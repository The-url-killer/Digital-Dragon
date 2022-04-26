// ignore_for_file: must_be_immutable

import 'dart:math';

import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/hooks/user-campaing.hook.dart';
import 'package:digital_dragon_v1/ui/components/input-no-border/input-no-border.component.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddAliesScreen extends StatefulWidget {
  AddAliesScreen({Key? key, required this.id, required this.type})
      : super(key: key);

  String id;
  String type;

  @override
  State<AddAliesScreen> createState() => _AddAliesScreenState();
}

class _AddAliesScreenState extends State<AddAliesScreen> {
  final ImagePicker _picker = ImagePicker();
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController loreController = TextEditingController();
  TextEditingController classController = TextEditingController();
  dynamic _image;

  bool isLoading = false;

  handleClick() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = _image;
    });
  }

  handleClickFinish() async {
    setState(() {
      isLoading = true;
    });
    if (widget.type == "monster") {
      await createMonster(
        name: nameController.text,
        image:
            "https://i.pinimg.com/564x/df/68/a0/df68a002fbf9186328ea24f147090618.jpg",
        id: widget.id,
        lore: loreController.text,
        aclass: classController.text,
        level: Random().nextInt(20) + 1,
      );
    } else if (widget.type == "place") {
      await craetePlace(
        name: nameController.text,
        image:
            "https://i.pinimg.com/564x/cf/3a/19/cf3a19bcbd8eaad59be9f1d02044eb33.jpg",
        id: widget.id,
        lore: loreController.text,
      );
    } else if (widget.type == "npc") {
      await createNpc(
        name: nameController.text,
        image:
            "https://i.pinimg.com/564x/df/68/a0/df68a002fbf9186328ea24f147090618.jpg",
        id: widget.id,
        lore: loreController.text,
        aclass: classController.text,
        level: Random().nextInt(20) + 1,
      );
      Navigator.pop(context);
    }

    setState(() {
      isLoading = false;
    });
    Navigator.pop(context);
  }

  var boxDecoration = const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      color: ColorsApp.kGrey);

  @override
  Widget build(BuildContext context) {
    double height = Sizes.heigth(context) * .3;
    double width = Sizes.width(context) * .6;

    renderImage() {
      return _image != null
          ? SizedBox(
              height: height,
              width: width,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.network(
                  _image!.path,
                  fit: BoxFit.fill,
                  height: height,
                  width: width,
                ),
              ),
            )
          : Material(
              child: Ink(
                  child: InkWell(
                onTap: () {
                  handleClick();
                },
                child: Container(
                  decoration: boxDecoration,
                  height: height,
                  width: width,
                  child: const Icon(Icons.image,
                      size: 100, color: ColorsApp.kPrimaryColor),
                ),
              )),
            );
    }

    renderClass() {
      if (widget.type == "place") {
        return const SizedBox(height: 0);
      }
      return InputNoBorder(controller: classController, hint: "Classe");
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Positioned(
              right: 7,
              top: 7,
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80,
                ),
                renderImage(),
                const SizedBox(height: 20),
                InputNoBorder(
                    controller: nameController,
                    hint: 'Digete o nome aqui'),
                TextFormField(
                  controller: loreController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide:
                            BorderSide(color: ColorsApp.kBlack, width: 1),
                      ),
                      hintText: 'Nos conte mais sobre ele',
                      hintStyle: TextStyle(color: ColorsApp.kPrimaryColor)),
                ),
                renderClass(),
                const SizedBox(height: 120),
                SizedBox(
                  width: Sizes.width(context) * .4,
                  child: SolidButton("Finish", ColorsApp.kPrimaryColor,
                      ColorsApp.kWhite, handleClickFinish, TypeButton.solid),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
