import 'package:ecommerce_app/widgets/custom_appbar.dart';
import 'package:ecommerce_app/widgets/custom_bottom_appbar.dart';
import 'package:ecommerce_app/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    final TextEditingController emailController = TextEditingController();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    final TextEditingController countryController = TextEditingController();
    final TextEditingController zipCodeController = TextEditingController();
    final TextEditingController contactNumberController =
        TextEditingController();
    return Scaffold(
        appBar: const CustomAppBar(title: 'Checkout'),
        bottomNavigationBar: const CustomBottomAppBar(screen: routeName),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'YOUR INFORMATION',
                style: Theme.of(context).textTheme.headline3,
              ),
              _buildTextFormField(
                emailController,
                context,
                'Email',
                Icons.email,
              ),
              _buildTextFormField(
                nameController,
                context,
                'Name',
                Icons.person,
              ),
              _buildTextFormField(
                contactNumberController,
                context,
                'Phone',
                Icons.call,
              ),
              Text(
                'DELIVERING TO',
                style: Theme.of(context).textTheme.headline3,
              ),
              _buildTextFormField(
                  countryController, context, 'Country', Icons.place_rounded),
              _buildTextFormField(
                cityController,
                context,
                'City',
                Icons.location_city,
              ),
              _buildTextFormField(
                addressController,
                context,
                'Address',
                Icons.home,
              ),
              _buildTextFormField(
                zipCodeController,
                context,
                'Zip Code',
                Icons.numbers,
              ),
              //ORDER Summary
              Text(
                'YOUR ORDER SUMMARY',
                style: Theme.of(context).textTheme.headline3,
              ),
              const WidgetOrderSummary(),
            ],
          ),
        ));
  }

  _buildTextFormField(controller, context, labelName, IconData icon) {
    return Row(children: [
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
        // keyboardType: TextInputType.emailAddress,
        controller: controller,
        decoration: const InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.only(left: 10),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ))
    ]);
  }
}
