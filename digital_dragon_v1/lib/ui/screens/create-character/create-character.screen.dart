import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:digital_dragon_v1/ui/resources/character_details_icons.dart';
import 'package:digital_dragon_v1/ui/screens/character/shards/character-home/character-home.screen.dart';
import 'package:digital_dragon_v1/ui/screens/create-character/shards/steps.component.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CreateCharacter extends StatefulWidget {
  const CreateCharacter({Key? key}) : super(key: key);

  @override
  State<CreateCharacter> createState() => _CreateCharacterState();
}

class _CreateCharacterState extends State<CreateCharacter> {
  static String email = "diulinho@rei.delas";
  TextEditingController nameController = TextEditingController();
  TextEditingController raceController = TextEditingController();
  TextEditingController classController = TextEditingController();
  TextEditingController hairController = TextEditingController();
  TextEditingController tendencyController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController peelController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController loreController = TextEditingController();
  TextEditingController connectionsController = TextEditingController();
  TextEditingController ideasController = TextEditingController();
  TextEditingController defectsController = TextEditingController();
  TextEditingController personalityTrailsController = TextEditingController();
  Map<String, bool> expertises = {};

  @override
  void initState() {
    super.initState();
    expertises = {
      "acrobatics": false,
      "animals": false,
      "arcanism": false,
      "atletism": false,
      "atuation": false,
      "history": false,
      "intuitc": false,
      "investigation": false,
      "intimidation": false,
      "speach": false,
      "medicine": false,
      "nature": false,
      "perception": false,
      "persuasion": false,
      "religion": false,
      "sleight of hand": false,
      "stealth": false,
      "survival": false,
    };
  }

  double strength = 0;
  double smart = 0;
  double constituation = 0;
  double carism = 0;
  double winsdom = 0;
  double dextery = 0;

  TextStyle titleStyle = const TextStyle(
      fontSize: FontSize.kFontSize24, color: ColorsApp.kPrimaryColor);

  inputDecoration(hint) => InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: ColorsApp.kBlack, width: 1),
        ),
        hintText: hint,
        hintStyle: const TextStyle(color: ColorsApp.kPrimaryColor),
      );

  TextStyle characterText = const TextStyle(
      fontSize: FontSize.kFontSize24,
      color: ColorsApp.kBlack,
      overflow: TextOverflow.ellipsis);
  TextStyle atributesIconText = const TextStyle(
    fontSize: FontSize.kFontSize36,
    color: ColorsApp.kBlack,
    fontWeight: FontWeight.bold,
  );

  TextStyle atributeDetailText =
      const TextStyle(fontSize: FontSize.kFontSize22);
  TextStyle numberText = const TextStyle(
      fontSize: FontSize.kFontSize22, fontWeight: FontWeight.w100);
  int level = 1;

  numberCalc(double number) => (((number - 10) / 2) - 0.49).round();

  formatNumber(double number) => numberCalc(number).toString();

  expertise(double number, bool isExpert) {
    int calc = numberCalc(number);

    if (!isExpert) {
      return calc.toString();
    }

    if (level <= 4) {
      return (calc + 2).toString();
    } else if (level <= 8) {
      return (calc + 3).toString();
    } else if (level <= 12) {
      return (calc + 4).toString();
    } else if (level <= 16) {
      return (calc + 5).toString();
    } else {
      return (calc + 6).toString();
    }
  }

  int step = 3;

  @override
  Widget build(BuildContext context) {
    renderStep() {
      if (step == 0) {
        return (Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: SizedBox(
                      height: 140,
                      width: 140,
                      child: Image.network(
                        "https://i.pinimg.com/564x/ee/29/1b/ee291bc6c014458ffefd5a8d454b3cde.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 180,
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Digite seu nome",
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextFormField(
              controller: raceController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite sua raça",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: classController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Digite sua clase",
              ),
            ),
            const SizedBox(height: 289),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      step = 1;
                    });
                  },
                  child: Container(
                    width: 85,
                    height: 35,
                    decoration: BoxDecoration(
                      color: ColorsApp.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsApp.kWhite,
                        fontSize: FontSize.kFontSize18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
      } else if (step == 1) {
        return Column(
          children: [
            const Text(
              "Detalhes do personagem",
              style: TextStyle(
                fontSize: FontSize.kFontSize22,
                color: ColorsApp.kPrimaryColor,
              ),
            ),
            const SizedBox(height: 40),
            TextFormField(
              controller: hairController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Como é seu cabelo?",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: ageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Sua idade",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: heightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Sua altura",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: peelController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Qual a cor de sua pele?",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: tendencyController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Tendência de seu personagem",
              ),
            ),
            const SizedBox(height: 183),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      step = 2;
                    });
                  },
                  child: Container(
                    width: 85,
                    height: 35,
                    decoration: BoxDecoration(
                      color: ColorsApp.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsApp.kWhite,
                        fontSize: FontSize.kFontSize18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      } else if (step == 2) {
        return Column(
          children: [
            TextFormField(
              controller: loreController,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: inputDecoration("Nos conte um pouco de sua história"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: connectionsController,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: inputDecoration("Nos conte suas ligações"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: ideasController,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: inputDecoration("Nos conte seus ideais"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: personalityTrailsController,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: inputDecoration("Traços de personalidade"),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: defectsController,
              maxLines: 3,
              textAlign: TextAlign.center,
              decoration: inputDecoration("Seus maiores defeitos"),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 59),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      step = 3;
                    });
                  },
                  child: Container(
                    width: 85,
                    height: 35,
                    decoration: BoxDecoration(
                      color: ColorsApp.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: ColorsApp.kWhite,
                        fontSize: FontSize.kFontSize18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Atributos",
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.strength_icon, size: 30),
                const SizedBox(width: 12),
                Text("Força", style: atributeDetailText),
                const SizedBox(width: 88),
                Text(formatNumber(strength), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (strength - 1 >= 0) {
                        strength -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(strength.toString(), style: const TextStyle(fontSize: 22)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      strength += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.speed_icon, size: 30),
                const SizedBox(width: 12),
                Text("Destreza", style: atributeDetailText),
                const SizedBox(width: 55),
                Text(formatNumber(dextery), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (dextery - 1 >= 0) {
                        dextery -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(dextery.toString(), style: const TextStyle(fontSize: 22)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      dextery += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.const_icon, size: 30),
                const SizedBox(width: 12),
                Text("Constituição", style: atributeDetailText),
                const SizedBox(width: 20),
                Text(formatNumber(constituation), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (constituation - 1 >= 0) {
                        constituation -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(constituation.toString(),
                    style: const TextStyle(fontSize: 22)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      constituation += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.smart_icon, size: 30),
                const SizedBox(width: 12),
                Text("Inteligência", style: atributeDetailText),
                const SizedBox(width: 25),
                Text(formatNumber(smart), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (smart - 1 >= 0) {
                        smart -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(smart.toString(), style: const TextStyle(fontSize: 22)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      smart += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.sabe_icon, size: 30),
                const SizedBox(width: 12),
                Text("Sabedoria", style: atributeDetailText),
                const SizedBox(width: 47),
                Text(formatNumber(winsdom), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (winsdom - 1 >= 0) {
                        winsdom -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(winsdom.toString(), style: const TextStyle(fontSize: 22)),
                IconButton(
                  onPressed: () {
                    setState(() {
                      winsdom += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(CharacterDetails.carism_icon, size: 30),
                const SizedBox(width: 12),
                Text("Carisma", style: atributeDetailText),
                const SizedBox(width: 67),
                Text(formatNumber(carism), style: numberText),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (carism - 1 >= 0) {
                        carism -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.exposure_minus_1_rounded, size: 20),
                ),
                Text(
                  carism.toString(),
                  style: const TextStyle(fontSize: 22),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      carism += 1;
                    });
                  },
                  icon: const Icon(Icons.plus_one_outlined, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("Perícias", textAlign: TextAlign.center, style: titleStyle),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["acrobatics"] =
                                    !expertises["acrobatics"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["acrobatics"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Acrobacia",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(dextery, expertises["acrobatics"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              print("Filho da puta");
                              setState(() {
                                expertises["animals"] = !expertises["animals"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["animals"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Adestrar Animais",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(winsdom, expertises["animals"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["arcanism"] =
                                    !expertises["arcanism"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["arcanism"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Arcanismo",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(smart, expertises["arcanism"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["atletism"] =
                                    !expertises["atletism"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["atletism"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Atletismo",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(strength, expertises["atletism"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["atuation"] =
                                    !expertises["atuation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["atuation"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Atuação",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(carism, expertises["atuation"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["speach"] = !expertises["speach"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["speach"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Enganação",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(carism, expertises["speach"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["stealth"] = !expertises["stealth"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["stealth"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Furtividade",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(dextery, expertises["stealth"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["history"] = !expertises["history"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["history"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("História",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(winsdom, expertises["history"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["intimidation"] =
                                    !expertises["intimidation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["intimidation"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Intimidação",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(carism, expertises["intimidation"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["intuitc"] = !expertises["intuitc"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["intuitc"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Intuição",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(carism, expertises["intuitc"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["investigation"] =
                                    !expertises["investigation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["investigation"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Investigação",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(smart, expertises["investigation"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["medicine"] =
                                    !expertises["medicine"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["medicine"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Medicina",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(winsdom, expertises["medicine"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["nature"] = !expertises["nature"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["nature"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Natureza",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(smart, expertises["nature"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["perception"] =
                                    !expertises["perception"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["perception"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Percepção",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(winsdom, expertises["perception"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["persuasion"] =
                                    !expertises["persuasion"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["persuasion"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Persuasão",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(carism, expertises["persuasion"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["sleight of hand"] =
                                    !expertises["sleight of hand"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["sleight of hand"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Prestidigitação",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(dextery, expertises["sleight of hand"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["religion"] =
                                    !expertises["religion"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["religion"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Religião",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(smart, expertises["religion"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                expertises["survival"] =
                                    !expertises["survival"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: expertises["survival"]!
                                    ? ColorsApp.kBlack
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text("Sobrevivência",
                              style: TextStyle(fontSize: FontSize.kFontSize18))
                        ],
                      ),
                      Text(
                        expertise(winsdom, expertises["survival"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        );
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: IconButton(
                  onPressed: () {
                    if (step == 0) {
                      Navigator.pop(context);
                    } else if (step == 1) {
                      setState(() {
                        step = 0;
                      });
                    } else if (step == 2) {
                      setState(() {
                        step = 1;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorsApp.kPrimaryColor,
                    size: 30,
                  ),
                ),
              )
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Steps(step: step),
              const SizedBox(height: 24),
              renderStep(),
            ]),
          ],
        ),
      ),
    );
  }
}
