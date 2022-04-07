import 'package:digital_dragon_v1/constants/colors.dart';
import 'package:digital_dragon_v1/constants/font_size.dart';
import 'package:digital_dragon_v1/constants/sizes.dart';
import 'package:flutter/cupertino.dart';

class CardItemCarousel extends StatelessWidget {
  const CardItemCarousel(
      {Key? key, required this.name, required this.image, this.subTitle = ""})
      : super(key: key);

  final String name;
  final String image;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(
      fontSize: FontSize.kFontSize36,
      color: ColorsApp.kWhite,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );

    const TextStyle subTitleStyle = TextStyle(
      fontSize: FontSize.kFontSize24,
      color: ColorsApp.kWhite,
      fontWeight: FontWeight.w400,
      overflow: TextOverflow.ellipsis,
    );

    return Stack(
      children: [
        SizedBox(
          height: Sizes.heigth(context) * .4,
          width: Sizes.width(context) * .8,
          child: FittedBox(
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.network(image)),
            fit: BoxFit.fill,
          ),
        ),
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Container(
            height: Sizes.heigth(context) * .4,
            width: Sizes.width(context) * .8,
            padding: const EdgeInsets.all(12),
            color: ColorsApp.kBlackOpacity03,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: titleStyle,
                ),
                if (subTitle.isNotEmpty) Text(subTitle, style: subTitleStyle)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
