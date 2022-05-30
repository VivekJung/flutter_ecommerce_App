import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class AdBanner120 extends StatelessWidget {
  final double? heightOfBanner;
  final String? imageUrl;
  final BoxFit? imgFit;
  final bool? hasUpperDivider, hasLowerDivider, hasIcon;
  const AdBanner120({
    Key? key,
    this.heightOfBanner,
    this.imageUrl,
    this.imgFit,
    this.hasUpperDivider,
    this.hasLowerDivider,
    this.hasIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        hasUpperDivider == true
            ? const Divider(color: Colors.black)
            : Container(),
        Stack(
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width - 0,
              height: heightOfBanner ?? 120,
              child: Image.network(
                imageUrl ??
                    "https://img.freepik.com/free-vector/sale-banner-template-design_91128-1361.jpg?t=st=1653894802~exp=1653895402~hmac=b3fc82d4a1abc886b1dd3a2b3556caa034543fed580a42eafe9ec56df26d67b3&w=740",
                fit: imgFit ?? BoxFit.fitWidth,
              ),
            ),
            //showing icons only if height of banner is greater than 118 for design consistency and ad feature
            heightOfBanner! > 118 && hasIcon == true
                ? Positioned(
                    top: 95,
                    left: 0,
                    right: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: iconButton(() {}, context, Icons.link, Colors.white))
                : Container(),
            heightOfBanner! > 118 && hasIcon == true
                ? Positioned(
                    top: 5,
                    right: 0,
                    left: MediaQuery.of(context).size.width - 30,
                    bottom: 0,
                    child: iconButton(
                        () {}, context, Icons.local_offer, Colors.white))
                : Container(),
            heightOfBanner! > 118 && hasIcon == true
                ? Positioned(
                    top: 90,
                    right: 0,
                    left: MediaQuery.of(context).size.width - 30,
                    bottom: 0,
                    child: iconButton(
                        () {}, context, Icons.info_outline, Colors.white))
                : Container(),
          ],
        ),
        hasLowerDivider == true
            ? const Divider(color: Colors.black)
            : Container(),
      ],
    );
  }
}
