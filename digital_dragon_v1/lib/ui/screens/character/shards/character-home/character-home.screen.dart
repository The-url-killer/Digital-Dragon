import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/character-model-screen-representation.model.dart';
import 'package:digital_dragon_v1/ui/resources/character_details_icons.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CharacterHomeScreen extends StatefulWidget {
  CharacterHomeScreen({Key? key, required this.characterModelScreen})
      : super(key: key);

  CharacterModelScreen characterModelScreen;

  @override
  State<CharacterHomeScreen> createState() => _CharacterHomeScreenState();
}

class _CharacterHomeScreenState extends State<CharacterHomeScreen> {
  late CharacterModelScreen _characterModelScreen;
  late double strength;
  late double smart;
  late double constituation;
  late double carism;
  late double winsdom;
  late double dextery;

  @override
  void initState() {
    super.initState();

    _characterModelScreen = widget.characterModelScreen;

    strength = _characterModelScreen.atributes["strength"]!.toDouble();
    constituation =
        _characterModelScreen.atributes["constituation"]!.toDouble();
    smart = _characterModelScreen.atributes["inteligence"]!.toDouble();
    carism = _characterModelScreen.atributes["carism"]!.toDouble();
    dextery = _characterModelScreen.atributes["dextery"]!.toDouble();
    winsdom = _characterModelScreen.atributes["winsdom"]!.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle characterText = const TextStyle(
        fontSize: FontSize.kFontSize24,
        color: ColorsApp.kBlack,
        overflow: TextOverflow.ellipsis);
    TextStyle atributesIconText = const TextStyle(
      fontSize: FontSize.kFontSize36,
      color: ColorsApp.kBlack,
      fontWeight: FontWeight.bold,
    );
    TextStyle titleStyle = const TextStyle(
        fontSize: FontSize.kFontSize24, color: ColorsApp.kPrimaryColor);
    TextStyle atributeDetailText =
        const TextStyle(fontSize: FontSize.kFontSize22);
    TextStyle numberText = const TextStyle(
        fontSize: FontSize.kFontSize22, fontWeight: FontWeight.w100);
    int level = _characterModelScreen.level;

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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        _characterModelScreen.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(_characterModelScreen.name, style: characterText),
                      Text(_characterModelScreen.aClass, style: characterText),
                      Text(_characterModelScreen.race, style: characterText),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 125,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.kBlack, width: 3),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _characterModelScreen.ca.toString(),
                        style: atributesIconText,
                      ),
                      const Icon(Icons.shield, size: 45),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 125,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.kBlack, width: 3),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _characterModelScreen.lifePoints.toString(),
                        style: atributesIconText,
                      ),
                      const Icon(Icons.health_and_safety_outlined, size: 45),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  height: 125,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: ColorsApp.kBlack, width: 3),
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _characterModelScreen.speed.toString(),
                        style: atributesIconText,
                      ),
                      const Icon(Icons.speed, size: 45),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              "Atributos",
              textAlign: TextAlign.center,
              style: titleStyle,
            ),
            const SizedBox(height: 24),
            AspectRatio(
              aspectRatio: 1.3,
              child: RadarChart(
                RadarChartData(
                  ticksTextStyle:
                      const TextStyle(color: Colors.transparent, fontSize: 10),
                  tickBorderData: const BorderSide(color: Colors.transparent),
                  gridBorderData:
                      const BorderSide(color: Colors.transparent, width: 2),
                  radarBorderData: const BorderSide(color: Colors.transparent),
                  radarBackgroundColor: Colors.transparent,
                  borderData: FlBorderData(show: false),
                  titlePositionPercentageOffset: 0.2,
                  tickCount: 1,
                  titleTextStyle:
                      const TextStyle(fontSize: FontSize.kFontSize14),
                  getTitle: (index) {
                    switch (index) {
                      case 0:
                        return 'For';
                      case 1:
                        return 'Const';
                      case 2:
                        return 'Sab';
                      case 3:
                        return 'Car';
                      case 4:
                        return 'Int';
                      case 5:
                        return 'Des';
                      default:
                        return '';
                    }
                  },
                  dataSets: [
                    RadarDataSet(
                      fillColor: ColorsApp.kPrimaryColor07.withOpacity(0.6),
                      borderColor: Colors.transparent,
                      dataEntries: [
                        RadarEntry(
                          value: strength,
                        ),
                        RadarEntry(
                          value: constituation,
                        ),
                        RadarEntry(
                          value: winsdom,
                        ),
                        RadarEntry(
                          value: carism,
                        ),
                        RadarEntry(
                          value: smart,
                        ),
                        RadarEntry(
                          value: dextery,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
                      ),
                      Text(strength.toString(),
                          style: const TextStyle(fontSize: 22)),
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
                      ),
                      Text(dextery.toString(),
                          style: const TextStyle(fontSize: 22)),
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
                      ),
                      Text(smart.toString(),
                          style: const TextStyle(fontSize: 22)),
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
                      ),
                      Text(winsdom.toString(),
                          style: const TextStyle(fontSize: 22)),
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
                        icon: const Icon(Icons.exposure_minus_1_rounded,
                            size: 20),
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
                ],
              ),
            ),
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
                                _characterModelScreen.expertises["acrobatics"] =
                                    !_characterModelScreen
                                        .expertises["acrobatics"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["acrobatics"]!
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
                        expertise(dextery,
                            _characterModelScreen.expertises["acrobatics"]!),
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
                                _characterModelScreen.expertises["animals"] =
                                    !_characterModelScreen
                                        .expertises["animals"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["animals"]!
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
                        expertise(winsdom,
                            _characterModelScreen.expertises["animals"]!),
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
                                _characterModelScreen.expertises["arcanism"] =
                                    !_characterModelScreen
                                        .expertises["arcanism"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["arcanism"]!
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
                        expertise(smart,
                            _characterModelScreen.expertises["arcanism"]!),
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
                                _characterModelScreen.expertises["atletism"] =
                                    !_characterModelScreen
                                        .expertises["atletism"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["atletism"]!
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
                        expertise(strength,
                            _characterModelScreen.expertises["atletism"]!),
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
                                _characterModelScreen.expertises["atuation"] =
                                    !_characterModelScreen
                                        .expertises["atuation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["atuation"]!
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
                        expertise(carism,
                            _characterModelScreen.expertises["atuation"]!),
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
                                _characterModelScreen.expertises["speach"] =
                                    !_characterModelScreen
                                        .expertises["speach"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["speach"]!
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
                        expertise(carism,
                            _characterModelScreen.expertises["speach"]!),
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
                                _characterModelScreen.expertises["stealth"] =
                                    !_characterModelScreen
                                        .expertises["stealth"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["stealth"]!
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
                        expertise(dextery,
                            _characterModelScreen.expertises["stealth"]!),
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
                                _characterModelScreen.expertises["history"] =
                                    !_characterModelScreen
                                        .expertises["history"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["history"]!
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
                        expertise(winsdom,
                            _characterModelScreen.expertises["history"]!),
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
                                _characterModelScreen
                                        .expertises["intimidation"] =
                                    !_characterModelScreen
                                        .expertises["intimidation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["intimidation"]!
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
                        expertise(carism,
                            _characterModelScreen.expertises["intimidation"]!),
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
                                _characterModelScreen.expertises["intuitc"] =
                                    !_characterModelScreen
                                        .expertises["intuitc"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["intuitc"]!
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
                        expertise(carism,
                            _characterModelScreen.expertises["intuitc"]!),
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
                                _characterModelScreen
                                        .expertises["investigation"] =
                                    !_characterModelScreen
                                        .expertises["investigation"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["investigation"]!
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
                        expertise(smart,
                            _characterModelScreen.expertises["investigation"]!),
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
                                _characterModelScreen.expertises["medicine"] =
                                    !_characterModelScreen
                                        .expertises["medicine"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["medicine"]!
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
                        expertise(winsdom,
                            _characterModelScreen.expertises["medicine"]!),
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
                                _characterModelScreen.expertises["nature"] =
                                    !_characterModelScreen
                                        .expertises["nature"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color:
                                    _characterModelScreen.expertises["nature"]!
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
                        expertise(
                            smart, _characterModelScreen.expertises["nature"]!),
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
                                _characterModelScreen.expertises["perception"] =
                                    !_characterModelScreen
                                        .expertises["perception"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["perception"]!
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
                        expertise(winsdom,
                            _characterModelScreen.expertises["perception"]!),
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
                                _characterModelScreen.expertises["persuasion"] =
                                    !_characterModelScreen
                                        .expertises["persuasion"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["persuasion"]!
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
                        expertise(carism,
                            _characterModelScreen.expertises["persuasion"]!),
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
                                _characterModelScreen
                                        .expertises["sleight of hand"] =
                                    !_characterModelScreen
                                        .expertises["sleight of hand"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["sleight of hand"]!
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
                        expertise(
                            dextery,
                            _characterModelScreen
                                .expertises["sleight of hand"]!),
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
                                _characterModelScreen.expertises["religion"] =
                                    !_characterModelScreen
                                        .expertises["religion"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["religion"]!
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
                        expertise(smart,
                            _characterModelScreen.expertises["religion"]!),
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
                                _characterModelScreen.expertises["survival"] =
                                    !_characterModelScreen
                                        .expertises["survival"]!;
                              });
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.5),
                                border: Border.all(
                                    color: ColorsApp.kBlack, width: 2),
                                color: _characterModelScreen
                                        .expertises["survival"]!
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
                        expertise(winsdom,
                            _characterModelScreen.expertises["survival"]!),
                        style: const TextStyle(fontSize: FontSize.kFontSize22),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
