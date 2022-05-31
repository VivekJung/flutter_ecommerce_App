import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class ProductBanner extends StatelessWidget {
  final double? heightOfBanner;
  final String? imageUrl;
  final Color? bgColor, arrowIconColor;
  final BoxFit? imgFit;
  const ProductBanner({
    Key? key,
    this.heightOfBanner,
    this.imageUrl,
    this.bgColor,
    this.imgFit,
    this.arrowIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const Divider(
        //   color: Colors.black,
        // ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8.0, bottom: 0.0),
              color: bgColor ?? Colors.white,
              width: MediaQuery.of(context).size.width - 0,
              height: heightOfBanner ?? 200,
              child: Image.network(
                imageUrl ??
                    "https://img.freepik.com/free-vector/sale-banner-template-design_91128-1361.jpg?t=st=1653894802~exp=1653895402~hmac=b3fc82d4a1abc886b1dd3a2b3556caa034543fed580a42eafe9ec56df26d67b3&w=740",
                fit: imgFit ?? BoxFit.fitHeight,
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              //button might not work if the position of icon is not well defined.
              //using -50 to solve this.
              right: MediaQuery.of(context).size.width - 50,
              bottom: 150,
              child: iconButton(
                () => activateRoute(context),
                context,
                Icons.arrow_back_ios,
                arrowIconColor ?? Colors.black,
              ),
            ),
          ],
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  void activateRoute(context) {
    Navigator.pushNamed(context, '/');
  }
}
