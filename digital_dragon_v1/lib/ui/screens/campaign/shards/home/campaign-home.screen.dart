import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class HomeCampaign extends StatefulWidget {
  HomeCampaign({
    Key? key,
    required this.image,
    required this.name,
    required this.lore,
  }) : super(key: key);

  String image;
  String name;
  String lore;

  @override
  State<HomeCampaign> createState() => _HomeCampaignState();
}

class _HomeCampaignState extends State<HomeCampaign> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 270,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            widget.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: FontSize.kFontSize24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            widget.lore,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: FontSize.kFontSize18,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
