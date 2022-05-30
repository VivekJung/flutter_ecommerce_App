import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class AdBanner120 extends StatelessWidget {
  const AdBanner120({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.black,
        ),
        Stack(
          children: [
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width - 0,
              height: 120,
              child: Image.network(
                "https://img.freepik.com/free-vector/sale-banner-template-design_91128-1361.jpg?t=st=1653894802~exp=1653895402~hmac=b3fc82d4a1abc886b1dd3a2b3556caa034543fed580a42eafe9ec56df26d67b3&w=740",
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
                top: 95,
                left: 0,
                right: MediaQuery.of(context).size.width,
                bottom: 0,
                child: iconButton(() {}, context, Icons.link, Colors.white)),
            Positioned(
                top: 5,
                right: 0,
                left: MediaQuery.of(context).size.width - 30,
                bottom: 0,
                child: iconButton(
                    () {}, context, Icons.local_offer, Colors.white)),
            Positioned(
                top: 90,
                right: 0,
                left: MediaQuery.of(context).size.width - 30,
                bottom: 0,
                child: iconButton(
                    () {}, context, Icons.info_outline, Colors.white)),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
