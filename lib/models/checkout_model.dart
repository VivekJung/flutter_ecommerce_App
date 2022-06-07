import 'package:ecommerce_app/models/models.dart';
import 'package:equatable/equatable.dart';

class Checkout extends Equatable {
  final String? fullName,
      email,
      address,
      city,
      country,
      zipcode,
      subtotal,
      deliveryFee,
      total;
  final List<Product>? products;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.address,
    required this.city,
    required this.country,
    required this.zipcode,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
    required this.products,
  });

  @override
  List<Object?> get props => [
        fullName,
        email,
        address,
        city,
        country,
        zipcode,
        subtotal,
        deliveryFee,
        total,
        products,
      ];

  Map<String, Object> toDocument() {
    Map customerAddress = {};
    customerAddress['address'] = address;
    customerAddress['city'] = city;
    customerAddress['country'] = country;
    customerAddress['zipcode'] = zipcode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFee': deliveryFee!,
      'total': total!,
    };
  }
}
