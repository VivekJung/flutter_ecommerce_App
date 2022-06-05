import 'dart:developer';

import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, "/product", arguments: product),
      child: Stack(
        children: [
          SizedBox(
            width: widthValue,
            height: 120,
            child: Image.network(
              product.imgUrl,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: leftPosition,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.9,
              height: 58,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            left: leftPosition + 3,
            right: 3,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width / 2.9 - 6,
              height: 62,
              decoration: BoxDecoration(color: Colors.black.withAlpha(120)),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'NRS ${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is CartLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is CartLoaded) {
                        return Expanded(
                          child: iconButton(() {
                            context
                                .read<CartBloc>()
                                .add(CartProductAdded(product));
                            _createSnackbar(context, 'Added to CART !',
                                Icons.shopping_cart);
                          }, context, Icons.shopping_cart, Colors.white),
                        );
                      } else {
                        log("Error occured while uploading to cart in product card section. Check it out");
                        return Text(
                          'Oops! Something went wrong',
                          style: Theme.of(context).textTheme.headline4,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _createSnackbar(BuildContext context, String msg, IconData iconData) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 20),
          Text(msg),
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
