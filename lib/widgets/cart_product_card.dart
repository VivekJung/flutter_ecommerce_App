import 'dart:developer';

import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartProductCard extends StatefulWidget {
  final Product product;
  final int quantity;
  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  // int _qty = 1;

  // void _qtyIncrementCounter() {
  //   setState(() {
  //     _qty++;
  //   });
  // }

  // void _qtyDecrementCounter() {
  //   setState(() {
  //     _qty--;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            widget.product.imgUrl,
            width: 100,
            height: 80,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.category,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.green[700])),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 230,
                  child: Text(widget.product.name,
                      style: Theme.of(context).textTheme.headline3),
                ),
                Text(
                  "NRs ${widget.product.price.toString()}",
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _itemQuantityIncreaser(context, widget.product, widget.quantity),
        ],
      ),
    );
  }

  _itemQuantityIncreaser(context, product, quantity) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          children: [
            iconButton(() {
              context.read<CartBloc>().add(CartProductRemoved(product));
              // _qty <= 1
              //     ? context.read<CartBloc>().add(CartProductRemoved(product))
              //     : _qtyDecrementCounter();
              // log("Cart product count: $_qty");
            }, context, Icons.remove_circle, Colors.red),
            const SizedBox(width: 10),
            Text('$quantity', style: Theme.of(context).textTheme.headline4),
            const SizedBox(width: 10),
            iconButton(() {
              // _qtyIncrementCounter();
              context.read<CartBloc>().add(CartProductAdded(product));
            }, context, Icons.add_circle, Colors.green),
          ],
        );
      },
    );
  }
}
