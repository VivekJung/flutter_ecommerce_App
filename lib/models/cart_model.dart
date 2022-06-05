import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const <Product>[]});

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double deliveryFee(subtotal) {
    double fee;
    subtotal > 3000.00 ? fee = 0.00 : fee = 500.00;
    return fee;
  }

  double get grandTotal => subtotal + deliveryFee(subtotal);

  double deliveryAmtStatus(subtotal) {
    if (subtotal >= 3000) {
      return 0;
    } else {
      double missingAmt = 3000.00 - subtotal;
      return missingAmt;
    }
  }

  String get grandTotalString => grandTotal.toStringAsFixed(2);
  String get subTotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get deliveryAmtStatusString =>
      deliveryAmtStatus(subtotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [products];
}
