import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:digital_dragon_v1/model/campaign-place-representation.model.dart';
import 'package:digital_dragon_v1/ui/screens/info/info.screen.dart';
import 'package:flutter/material.dart';

class Places extends StatefulWidget {
  Places({Key? key, required this.places}) : super(key: key);

  List<dynamic> places;

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  @override
  Widget build(BuildContext context) {
    double width = Sizes.width(context) * 0.4;
    double heigth = Sizes.heigth(context) * 0.5;

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GridView.count(
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          padding: const EdgeInsets.only(top: 40, left: 20),
          crossAxisCount: 2,
          children: widget.places
              .map(
                (place) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Info(
                          placeModel: place,
                        ),
                      ),
                    );
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: SizedBox(
                          width: width,
                          height: heigth,
                          child: Image.network(
                            place.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width,
                        height: heigth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: width,
                              height: 30,
                              padding: const EdgeInsets.only(top: 6, left: 15),
                              decoration: const BoxDecoration(
                                color: ColorsApp.kGreyOpacity07,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                place.name,
                                style: const TextStyle(
                                  fontSize: FontSize.kFontSize14,
                                  color: ColorsApp.kWhite,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}
