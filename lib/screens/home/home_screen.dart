import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
//List of widget making container from the images in above listed string.

    return Scaffold(
      appBar: const CustomAppBar(title: "Ayur Sadan"),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Column(
        children: [
          //categories
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: true,
            ),
            //mapping each category from static list of categories
            //and passing it into HeroCarousal card
            items: Category.categories
                .map((category) => HeroCarousalCard(category: category))
                .toList(),
          ),
          // scrollable-lists
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SectionTitle(title: "TAILORED FOR YOU"),
                  ProductCarousel(
                      products: Product.products
                          .where((product) => product.isRecommended)
                          .toList()),
                  const AdBanner120(),
                  const SectionTitle(title: "IN HIGH DEMAND"),
                  ProductCarousel(
                      products: Product.products
                          .where((product) => product.isPopular)
                          .toList()),
                  const SectionTitle(title: "Testing"),
                  ProductCarousel(products: Product.products),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
