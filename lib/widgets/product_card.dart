import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  const ProductCard({
    Key? key,
    required this.product,
    this.widthFactor = 2.5,
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
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.9,
              height: 40,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            left: 3,
            right: 3,
            bottom: 3,
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              width: MediaQuery.of(context).size.width / 2.9 - 6,
              height: 45,
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
                  Expanded(
                    child: iconButton(
                        () {}, context, Icons.add_circle, Colors.white),
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
