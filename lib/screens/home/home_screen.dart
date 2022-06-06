import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/blocs/category/category_bloc.dart';
import 'package:ecommerce_app/blocs/product/product_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is CategoryLoaded) {
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    enableInfiniteScroll: true,
                  ),
                  //mapping each category from static list of categories
                  //and passing it into HeroCarousal card
                  items: state.categories
                      .map((category) => HeroCarousalCard(category: category))
                      .toList(),
                );
              } else {
                return const Text('Something went wrong');
              }
            },
          ),
          // scrollable-lists
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const AdBanner120(
                    heightOfBanner: 120,
                    imageUrl:
                        "https://image.shutterstock.com/image-vector/healthy-vector-banner-design-concept-260nw-507123040.jpg",
                    imgFit: BoxFit.fitWidth,
                    hasUpperDivider: false,
                    hasLowerDivider: false,
                    hasIcon: false,
                  ),
                  const SectionTitle(title: "TAILORED FOR YOU"),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductLoaded) {
                        return ProductCarousel(
                            products: state.products
                                .where((product) => product.isRecommended)
                                .toList());
                      } else {
                        return const Text(
                            'Something is wrong while loading products');
                      }
                    },
                  ),
                  const AdBanner120(
                    heightOfBanner: 120,
                    hasUpperDivider: true,
                    hasLowerDivider: true,
                    hasIcon: true,
                    imgFit: BoxFit.fitWidth,
                    imageUrl:
                        "https://businessfirstfamily.com/wp-content/uploads/2017/04/sale-banners-tips-business-owners.jpg",
                  ),
                  const SectionTitle(title: "CRAZILY IN DEMAND"),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductLoaded) {
                        return ProductCarousel(
                            products: state.products
                                .where((product) => product.isPopular)
                                .toList());
                      } else {
                        return const Text(
                            'Something is wrong while loading products');
                      }
                    },
                  ),
                  const SectionTitle(title: "NEW IN THE HOOD"),
                  BlocBuilder<ProductBloc, ProductState>(
                    builder: (context, state) {
                      if (state is ProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is ProductLoaded) {
                        return ProductCarousel(products: state.products);
                      } else {
                        return const Text(
                            'Something is wrong while loading products');
                      }
                    },
                  ),
                  const AdBanner120(
                    heightOfBanner: 160,
                    hasLowerDivider: true,
                    hasUpperDivider: true,
                    hasIcon: true,
                    imgFit: BoxFit.fill,
                    imageUrl:
                        "https://image.shutterstock.com/image-vector/big-sale-banner-discounts-vector-260nw-311461337.jpg",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
