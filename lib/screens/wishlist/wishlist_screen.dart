import 'dart:developer';

import 'package:ecommerce_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
      appBar: const CustomAppBar(title: "WishList"),
      bottomNavigationBar: const CustomBottomAppBar(screen: routeName),
      body: BlocBuilder<WishListBloc, WishListState>(
        builder: (context, state) {
          try {
            if (state is WishListLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 7, 153, 11),
                ),
              );
            }
            if (state is WishListLoaded) {
              var wishListedProducts = state.wishList.products;
              return _wishListContent(wishListedProducts);
            } else {
              return const Text('Oops! Looks like some error has occured');
            }
          } catch (e) {
            log('$e');
            throw UnimplementedError('ERROR While Creating Wish-list \n$e');
          }
        },
      ),
    );
  }

  _wishListContent(List<Product> wishListedProducts) {
    return Column(
      children: [
        const SizedBox(height: 10),
        TextWidget(
          text:
              "'${wishListedProducts.length}' product(s) found in your Wishlist ",
          fontSize: 10,
          fontWeight: FontWeight.w300,
        ),
        Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 2.2,
            ),
            itemCount: wishListedProducts.length,
            itemBuilder: (context, index) {
              return wishlistGridContent(context, index, wishListedProducts);
            },
          ),
        ),
        const Divider(color: Colors.black),
      ],
    );
  }

  wishlistGridContent(
    BuildContext context,
    int index,
    List<Product> wishListedProdcuts,
  ) {
    Product product = wishListedProdcuts[index];
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 10),
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width - 16,
      height: 155,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                width: 100,
                height: 120,
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 155,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    iconButton(
                        () {}, context, Icons.shopping_cart, Colors.green),
                    const SizedBox(height: 10),
                    iconButton(() {}, context, Icons.remove_circle, Colors.red),
                    const SizedBox(height: 20),
                    Text(
                      "NRs ${product.price.toInt().toString()}",
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      product.category,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.black),
                    ),
                    Text(
                      product.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(color: Colors.black),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
          Container(height: 1, color: Colors.grey),
        ],
      ),
    );
  }
}
