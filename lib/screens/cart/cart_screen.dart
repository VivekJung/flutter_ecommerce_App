import 'dart:developer';

import 'package:ecommerce_app/blocs/cart/cart_bloc.dart';
import 'package:ecommerce_app/config/theme/custom_text_widget.dart';
import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = "/cart";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CartScreen());
  }

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    log(const Cart().subtotal.toString());
    return Scaffold(
        appBar: const CustomAppBar(title: "Cart"),
        bottomNavigationBar: const BottomAppBar(
          color: Colors.black,
          child: BottomMenuCart(),
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoaded) {
              var cartState = state.cart;
              return cartContentsDisplay(context, cartState);
            } else {
              log('Unknown Error in Cart Section. Check it up');
              return Text(
                'Oops! something went wrong. :/',
                style: Theme.of(context).textTheme.headline3,
              );
            }
          },
        ));
  }

  Padding cartContentsDisplay(
    BuildContext context,
    Cart cartContents,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              cartContents.subtotal < 3000
                  //Delivery fee status message with action button
                  ? Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add item worth ${cartContents.deliveryAmtStatusString} or more and \nget Delivery package worth 500 for FREE !",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Colors.red),
                            ),
                            Container(
                              height: 40,
                              padding: const EdgeInsets.only(top: 2, bottom: 2),
                              color: Colors.black,
                              child: Center(
                                child: CustomIconButton(
                                  context: context,
                                  bgColor: Colors.black,
                                  iconColor: Colors.white,
                                  icon: Icons.add_circle,
                                  elevation: 0,
                                  buttonFunction: () =>
                                      Navigator.pushNamed(context, '/'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  : Text(
                      'WOW !! You have unlocked "Delivery Package : LV 1". \nWith this you can get NRs 500 off on total billing',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.green),
                    ),
              const Divider(color: Colors.grey),
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: cartContents.products.length,
                  itemBuilder: (context, index) {
                    return CartProductCard(
                      product: cartContents.products[index],
                    );
                  },
                ),
              ),
            ],
          ),
          Column(children: [
            const Divider(color: Colors.black),
            _billing(context, cartContents.subTotalString,
                cartContents.deliveryFeeString),
            _grandTotal(context, cartContents.grandTotalString),
          ]),
        ],
      ),
    );
  }

  _billing(context, subtotal, deliveryFee) {
    log(subtotal.toString());
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
              Text('$deliveryFee/-',
                  style: Theme.of(context).textTheme.headline4),
            ],
          ),
        ],
      ),
    );
  }

  _grandTotal(BuildContext context, grandTotal) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(50),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(3.0),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          height: 50,
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
      ],
    );
  }
}

class BottomMenuCart extends StatelessWidget {
  const BottomMenuCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      height: 60,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            context: context,
            bgColor: Colors.transparent,
            iconColor: Colors.white,
            icon: Icons.arrow_back_ios_new,
            buttonFunction: () => Navigator.pop(context),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color.fromARGB(255, 6, 168, 0),
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              child: const Center(
                child: TextWidget(
                  text: "  CHECKOUT  ",
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  textColor: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          CustomIconButton(
            context: context,
            bgColor: Colors.transparent,
            iconColor: Colors.white,
            icon: Icons.home,
            buttonFunction: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
