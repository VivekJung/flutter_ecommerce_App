import 'dart:async';

import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  static const String routeName = "/splash";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const SplashScreen());
  }
}

class _SplashScreenState extends State<SplashScreen> {
  double iconSize = 100;
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(milliseconds: 1000),
        () => Navigator.pushNamed(context, '/'));
    return SafeArea(
      child: Scaffold(
        body: _initialSplashScreen(),
      ),
    );
  }

  _initialSplashScreen() {
    return Center(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.eco,
              size: iconSize,
              color: Colors.green[700],
            ),
            const TextWidget(
              fontSize: 30,
              text: "Ayur Sadan",
              fontWeight: FontWeight.w300,
              textColor: Colors.black,
              align: TextAlign.center,
            ),
            // const SizedBox(height: 30),
            const TextWidget(
              fontSize: 12,
              text: "Inspiring you: Now and forever",
              fontWeight: FontWeight.w500,
              textColor: Colors.black,
              align: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
