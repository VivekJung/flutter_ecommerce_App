import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class CatalogScreen extends StatelessWidget {
  final Category category;
  final double widthFactor;

  const CatalogScreen(
      {Key? key, required this.category, this.widthFactor = 2.2})
      : super(key: key);

  static const String routeName = "/catalog";
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => CatalogScreen(
              category: category,
            ));
  }

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Column(
        children: [
          CategoryBanner(imageUrl: category.imgUrl),
          TextWidget(
            text:
                "'${categoryProducts.length}' product(s) found under '${category.name}' category ",
            fontSize: 8,
            fontWeight: FontWeight.w300,
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.35,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(
                        top: 0.0, left: 0.0, right: 0.0, bottom: 0),
                    child: ProductCard(
                      product: categoryProducts[index],
                      widthFactor: 2.2,
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.black),
          const BottomMenuProduct(),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}
