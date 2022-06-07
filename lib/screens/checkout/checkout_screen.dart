import 'package:ecommerce_app/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = "/checkout";
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => const CheckOutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Checkout'),
        bottomNavigationBar: const CustomBottomAppBar(screen: routeName),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CheckoutLoaded) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //delivery and personal information
                      Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height / 3 + 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'YOUR INFORMATION',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(email: value),
                                    );
                              },
                              context,
                              'Email',
                              Icons.email,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(fullName: value),
                                    );
                              },
                              context,
                              'Name',
                              Icons.person,
                            ),
                            Text(
                              'SHIPPING INFORMATION',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(country: value),
                                    );
                              },
                              context,
                              'Country',
                              Icons.place_rounded,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(city: value),
                                    );
                              },
                              context,
                              'City',
                              Icons.location_city,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(address: value),
                                    );
                              },
                              context,
                              'Address',
                              Icons.home,
                            ),
                            _buildTextFormField(
                              (value) {
                                context.read<CheckoutBloc>().add(
                                      UpdateCheckout(zipcode: value),
                                    );
                              },
                              context,
                              'Zip Code',
                              Icons.numbers,
                            ),
                          ],
                        ),
                      ),
                      //choose payment method
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SELECT YOUR PAYMENT OPTION',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(color: Colors.white),
                              ),
                              iconButton(() {}, context,
                                  Icons.arrow_forward_ios, Colors.white),
                            ],
                          )),
                      const SizedBox(height: 20),
                      //ORDER Summary
                      Container(
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height / 4,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'YOUR ORDER SUMMARY',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              const WidgetOrderSummary(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Text("Ooops! Something went wrong");
              }
            },
          ),
        ));
  }

  _buildTextFormField(
    Function(String)? onChanged,
    context,
    labelName,
    IconData icon,
  ) {
    return SizedBox(
      height: 50,
      child: Row(children: [
        Icon(icon),
        const SizedBox(width: 5),
        SizedBox(
          width: 75,
          child: Text(
            labelName,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
            child: TextFormField(
          initialValue: "test informai",
          onChanged: onChanged,
          decoration: const InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.only(left: 10),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
          ),
        ))
      ]),
    );
  }
}
