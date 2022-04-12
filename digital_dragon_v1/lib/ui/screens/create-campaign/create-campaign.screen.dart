import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/routes.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/constants/type_button.dart';
import 'package:digital_dragon_v1/ui/components/input-no-border/input-no-border.component.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateCampaign extends StatefulWidget {
  const CreateCampaign({Key? key}) : super(key: key);

  @override
  _CreateCampaignState createState() => _CreateCampaignState();
}

class _CreateCampaignState extends State<CreateCampaign> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  TextEditingController imageController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController loreController = TextEditingController();

  handleClick() async {
    _image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = _image;
    });
  }

  handleClickFinish() {
    Navigator.pushNamed(context, Routes.home);
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

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            renderImage(),
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
              child: SolidButton("Finish", ColorsApp.kPrimaryColor,
                  ColorsApp.kWhite, handleClickFinish, TypeButton.solid),
            ),
          ],
        ),
      ),
    );
  }
}
