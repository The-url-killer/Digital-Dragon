import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/hooks/use-characters.hook.dart';
import 'package:digital_dragon_v1/ui/components/solid-button.component.dart';
import 'package:flutter/material.dart';

class CreateItem extends StatefulWidget {
  CreateItem({Key? key, required this.id}) : super(key: key);

  String id;

  @override
  State<CreateItem> createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  String? dropdownValue;
  late Widget _form;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController damageController = TextEditingController();
  TextEditingController weaponClassController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController armorClassController = TextEditingController();
  TextEditingController strengthController = TextEditingController();
  bool isDesStealh = false;

  @override
  initState() {
    super.initState();
    setState(() {
      _form = const Text("Selecione algo");
    });
  }

  handleClick() async {
    if (dropdownValue == "Comum") {
      await createItem(
          armorClass: "",
          damage: "",
          description: "",
          name: nameController.text,
          price: priceController.text,
          size: double.parse(sizeController.text),
          typeEquipment: "COMMON",
          desStealth: false,
          id: widget.id,
          strength: 0,
          weaponClass: "");
    } else if (dropdownValue == "Arma") {
      createItem(
          armorClass: "",
          damage: damageController.text,
          description: descriptionController.text,
          name: nameController.text,
          price: priceController.text,
          size: double.parse(sizeController.text),
          typeEquipment: "WEAPON",
          desStealth: false,
          id: widget.id,
          strength: 0,
          weaponClass: weaponClassController.text);
    } else if (dropdownValue == "Armadura") {
      createItem(
          armorClass: armorClassController,
          damage: "",
          description: "",
          name: nameController.text,
          price: priceController.text,
          size: double.parse(sizeController.text),
          typeEquipment: "ARMOR",
          desStealth: isDesStealh,
          id: widget.id,
          strength: int.parse(strengthController.text),
          weaponClass: "");
    }
  }

  baseForm() => Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: 'Nome',
            ),
          ),
          TextField(
            controller: priceController,
            decoration: const InputDecoration(
              labelText: 'Preço',
            ),
          ),
          TextField(
            controller: sizeController,
            decoration: const InputDecoration(
              labelText: 'Peso (Kg)',
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorsApp.kPrimaryColor;
      }
      return ColorsApp.kPrimaryColor;
    }

    renderForm() {
      switch (dropdownValue) {
        case 'Arma':
          _form = Column(
            children: [
              baseForm(),
              TextField(
                controller: weaponClassController,
                decoration: const InputDecoration(
                  labelText: 'Classe da arma',
                ),
              ),
              TextField(
                controller: damageController,
                decoration: const InputDecoration(
                  labelText: 'Dano',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 5,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(color: ColorsApp.kBlack, width: 1),
                    ),
                    hintText: 'Propriedades',
                    hintStyle: TextStyle(color: ColorsApp.kPrimaryColor)),
              ),
            ],
          );
          break;
        case 'Armadura':
          _form = Column(
            children: [
              baseForm(),
              TextField(
                controller: armorClassController,
                decoration: const InputDecoration(
                  labelText: 'Classe da armadura',
                ),
              ),
              TextFormField(
                controller: strengthController,
                decoration: const InputDecoration(
                  labelText: 'Força necessária',
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  Checkbox(
                    checkColor: ColorsApp.kPrimaryColor,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isDesStealh,
                    onChanged: (bool? value) {
                      setState(() {
                        isDesStealh = value!;
                      });
                    },
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Desvantagem de furtividade',
                  ),
                ],
              ),
            ],
          );
          break;
        case 'Comum':
          _form = baseForm();
          break;
        default:
          _form = const Text("Selecione algo");
          break;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Positioned(
                    left: 0,
                    top: 0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: ColorsApp.kPrimaryColor,
                        size: 30,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              DropdownButton(
                value: dropdownValue,
                items: <String>["Arma", "Armadura", "Comum"]
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    renderForm();
                  });
                },
                hint: const Text("Tipo de item"),
                isExpanded: true,
              ),
              const SizedBox(height: 8),
              _form,
              if (dropdownValue == "Comum") (const SizedBox(height: 400)),
              if (dropdownValue == "Arma") (const SizedBox(height: 158)),
              if (dropdownValue == "Armadura") (const SizedBox(height: 262)),
              if (dropdownValue != null)
                (SolidButton("Criar", ColorsApp.kPrimaryColor, ColorsApp.kWhite,
                    handleClick, "solid"))
            ],
          ),
        ),
      ),
    );
  }
}
