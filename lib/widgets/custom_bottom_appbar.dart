import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/theme/custom_text_widget.dart';

class CustomBottomAppBar extends StatelessWidget {
  final String screen;
  const CustomBottomAppBar({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.black,
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _selectNavBar(context, screen) ?? _buildNavBar(context),
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);
      default:
        return _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      iconButton(
        () => Navigator.pushNamed(context, '/'),
        context,
        Icons.home,
        Colors.white,
      ),
      iconButton(
        () => Navigator.pushNamed(context, '/cart'),
        context,
        Icons.shopping_cart,
        Colors.white,
      ),
      iconButton(
        () => Navigator.pushNamed(context, '/user'),
        context,
        Icons.person,
        Colors.white,
      ),
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      CustomIconButton(
        context: context,
        bgColor: Colors.transparent,
        iconColor: Colors.white,
        icon: Icons.arrow_back_ios_new,
        buttonFunction: () => Navigator.pop(context),
      ),
      const SizedBox(width: 20),
      BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CheckoutLoaded) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<CheckoutBloc>()
                        .add(ConfirmCheckout(checkout: state.checkout));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: const Color.fromARGB(255, 206, 101, 40),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: const Center(
                    child: TextWidget(
                      text: "ORDER NOW",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      textColor: Colors.white,
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Text('Oops! Something went wrong ');
          }
        },
      ),
      const SizedBox(width: 20),
      CustomIconButton(
        context: context,
        bgColor: Colors.transparent,
        iconColor: Colors.white,
        icon: Icons.home,
        buttonFunction: () => Navigator.pushNamed(context, '/'),
      ),
    ];
  }
}
