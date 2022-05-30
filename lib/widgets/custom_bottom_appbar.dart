import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            iconButton(
              () => Navigator.pushNamed(context, '/'),
              context,
              Icons.home,
              Colors.white,
            ),
            iconButton(
              () => Navigator.pushNamed(context, '/cart'),
              context,
              Icons.shopping_cart,
              Colors.white,
            ),
            iconButton(
              () => Navigator.pushNamed(context, '/user'),
              context,
              Icons.person,
              Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
