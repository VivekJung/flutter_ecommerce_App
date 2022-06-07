import 'dart:developer';

import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetOrderSummary extends StatelessWidget {
  const WidgetOrderSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CartLoaded) {
          var cartState = state.cart;
          log('${cartState.subtotal.runtimeType}');
          return Column(children: [
            const Divider(color: Colors.black),
            billing(
                context, cartState.subTotalString, cartState.deliveryFeeString),
            grandTotal(context, cartState.grandTotalString),
          ]);
        } else {
          log('Unknown Error in WidgetWidgetOrderSummary. Check it up');
          return Text(
            'Oops! something went wrong. :/',
            style: Theme.of(context).textTheme.headline3,
          );
        }
      },
    );
  }

  billing(context, subtotal, deliveryFee) {
    double deliveryCharge;
    if (double.parse(subtotal) == 0.00) {
      deliveryCharge = 0.00;
    } else {
      deliveryCharge = double.parse(deliveryFee);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SUBTOTAL ', style: Theme.of(context).textTheme.headline4),
              Text('$subtotal/-', style: Theme.of(context).textTheme.headline4),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('DELIVERY FEE ',
                  style: Theme.of(context).textTheme.headline4),
              Text('${deliveryCharge.toString()}/-',
                  style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ],
      ),
    );
  }

  grandTotal(BuildContext context, grandTotal) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: 52,
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('GRAND TOTAL ',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white)),
                Text('NRS  $grandTotal/-',
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: Colors.white)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
