import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  static const String routeName = "/product";
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  const ProductScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Product Info"),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: BottomMenuProduct(product: product),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ProductBanner(
                  imageUrl: product.imgUrl,
                  bgColor: Colors.white,
                  arrowIconColor: Colors.black,
                  imgFit: BoxFit.fitHeight,
                ),
                ProductTitle(product: product),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    "BASIC INFORMATION \non '${product.name}' ",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: [
                    ListTile(title: Text(product.details)),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    "HEALTH BENEFITS\nWhy do I need this?",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: [
                    ListTile(title: Text(product.details)),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    "CONSUMER FEEDBACKS\nAll the buzz on this!",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ExpansionTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Jeevan Kadel"),
                        children: [
                          ListTile(title: Text(product.details)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ExpansionTile(
                        leading: const Icon(Icons.person),
                        title: const Text("Mohini Karki"),
                        children: [
                          ListTile(title: Text(product.details)),
                        ],
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  initiallyExpanded: false,
                  title: Text(
                    "INGREDIENTS\nWhat actually is in this?",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  children: [
                    ListTile(title: Text(product.details)),
                  ],
                ),
              ],
            ),
          ),
          const Divider(color: Colors.black),
        ],
      ),
    );
  }
}

class BottomMenuProduct extends StatelessWidget {
  final Product product;
  const BottomMenuProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Row(
        children: [
          CustomIconButton(
              context: context,
              bgColor: Colors.transparent,
              iconColor: Colors.white,
              icon: Icons.arrow_back_ios_new,
              buttonFunction: () => Navigator.pop(context)),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              children: [
                BlocBuilder<WishListBloc, WishListState>(
                    builder: (context, state) {
                  return CustomIconButton(
                    context: context,
                    bgColor: const Color.fromARGB(255, 163, 3, 3),
                    iconColor: Colors.white,
                    icon: Icons.favorite,
                    iconLabelText: "To Wishlist",
                    buttonFunction: () {
                      context
                          .read<WishListBloc>()
                          .add(AddWishListProduct(product));

                      final snackBar = SnackBar(
                        content: Row(
                          children: const [
                            Icon(Icons.favorite, color: Colors.white),
                            SizedBox(width: 20),
                            Text('Added to your Wishlist !'),
                          ],
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                  );
                }),
                const SizedBox(width: 10),
                CustomIconButton(
                  context: context,
                  bgColor: const Color.fromARGB(255, 11, 163, 57),
                  iconColor: Colors.white,
                  icon: Icons.shopping_cart,
                  iconLabelText: "Add to CART",
                  buttonFunction: () {},
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  context: context,
                  bgColor: const Color.fromARGB(255, 3, 70, 158),
                  iconColor: Colors.white,
                  icon: Icons.share,
                  iconLabelText: "Share",
                  buttonFunction: () {},
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  context: context,
                  bgColor: const Color.fromARGB(255, 161, 125, 7),
                  iconColor: Colors.white,
                  icon: Icons.star,
                  iconLabelText: "Rate",
                  buttonFunction: () {},
                ),
                const SizedBox(width: 10),
                CustomIconButton(
                  context: context,
                  bgColor: const Color.fromARGB(255, 8, 47, 175),
                  iconColor: Colors.white,
                  icon: Icons.comment,
                  iconLabelText: "Comment",
                  buttonFunction: () {},
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 60,
              color: Colors.black.withAlpha(50),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 5,
            right: 5,
            left: 5,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width - 50,
              height: 60,
              color: Colors.black.withAlpha(180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${product.alias} with",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(color: Colors.white),
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.category,
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                      Text(
                        "Only at NRs: ${product.price.toInt().toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ],
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
