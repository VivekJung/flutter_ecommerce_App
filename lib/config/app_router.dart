import 'dart:developer';

import 'package:ecommerce_app/models/category_model.dart';
import 'package:ecommerce_app/screens/screens.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    log('This is route: ${settings.name}');

    switch (settings.name) {
      // case '/':
      //   return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case WishListScreen.routeName:
        return WishListScreen.route();
      case ProductScreen.routeName:
        return ProductScreen.route();

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text('Something is wrong')),
            ));
  }
}
