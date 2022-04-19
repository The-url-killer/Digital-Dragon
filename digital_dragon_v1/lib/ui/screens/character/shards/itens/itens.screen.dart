import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/item.model.dart';
import 'package:flutter/material.dart';

class ItensScreen extends StatefulWidget {
  ItensScreen({Key? key, required this.itens, required this.money})
      : super(key: key);

  List<dynamic> itens;
  Map<String, int> money;

  @override
  State<ItensScreen> createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  renderMoney(String type, int? money) {
    return money! > 0
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                type,
                style: const TextStyle(
                  color: ColorsApp.kPrimaryColor,
                  fontSize: FontSize.kFontSize14,
                ),
              ),
              Text(
                money.toString(),
                style: const TextStyle(
                    color: ColorsApp.kBlack, fontSize: FontSize.kFontSize18),
              )
            ],
          )
        : Text(
            type,
            style: const TextStyle(
              color: ColorsApp.kPrimaryColor,
              fontSize: FontSize.kFontSize24,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = const TextStyle(
        color: ColorsApp.kPrimaryColor, fontSize: FontSize.kFontSize18);

    Widget rendetText(Item item) {
      if (item.typeEquipment == "COMMON") {
        return const SizedBox(height: 0);
      } else if (item.typeEquipment == "WEAPON") {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.description!),
            const SizedBox(height: 8),
            Text(item.damage!),
          ],
        );
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.armorClass!),
          const SizedBox(height: 8),
          Text(item.desStealth!
              ? "Tem desvantagem em ações de destreza"
              : "Não tem desvantagem")
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: Sizes.width(context) * 0.18,
            height: Sizes.heigth(context) * 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: ColorsApp.kBlack, width: 1),
                  ),
                  child: Center(child: renderMoney("PO", widget.money["po"])),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: ColorsApp.kBlack, width: 1),
                  ),
                  child: Center(child: renderMoney("PL", widget.money["pl"])),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: ColorsApp.kBlack, width: 1),
                  ),
                  child: Center(child: renderMoney("PP", widget.money["pp"])),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: ColorsApp.kBlack, width: 1),
                  ),
                  child: Center(child: renderMoney("PE", widget.money["pc"])),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: ColorsApp.kBlack, width: 1),
                  ),
                  child: Center(child: renderMoney("PC", widget.money["pe"])),
                ),
              ],
            ),
          ),
          SizedBox(
            height: Sizes.heigth(context) - 110,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(left: 20),
                width: Sizes.width(context) * 0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: widget.itens
                      .map((item) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: 60,
                                minWidth: Sizes.width(context) * 0.7,
                                maxWidth: Sizes.width(context) * 0.7,
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: ColorsApp.kBlack, width: 1),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          item.name,
                                          style: titleStyle,
                                        ),
                                        Text(
                                          item.price,
                                          style: titleStyle,
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    rendetText(item)
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
