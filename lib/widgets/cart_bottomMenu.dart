import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BottomMenuCart extends StatelessWidget {
  const BottomMenuCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            context: context,
            bgColor: Colors.transparent,
            iconColor: Colors.white,
            icon: Icons.arrow_back_ios_new,
            buttonFunction: () => Navigator.pop(context),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/checkout');
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color.fromARGB(255, 3, 168, 0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Center(
                child: TextWidget(
                  text: "  CHECKOUT  ",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          CustomIconButton(
            context: context,
            bgColor: Colors.transparent,
            iconColor: Colors.white,
            icon: Icons.home,
            buttonFunction: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
