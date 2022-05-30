import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  static const String routeName = "/wishlist";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const WishListScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "WishList"),
      bottomNavigationBar: CustomBottomAppBar(),
    );
  }
}
