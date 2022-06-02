import 'package:equatable/equatable.dart';

import 'product_model.dart';

class Cart extends Equatable {
  Cart();

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double fee = 0.00;
  double deliveryFee(subtotal) {
    subtotal > 3000.00 ? fee = 0.00 : fee = 500.00;
    return fee;
  }

  double get grandTotal => subtotal + deliveryFee(subtotal);

  String freeDelivery(subtotal) {
    if (subtotal > 3000) {
      return 'You have Free Delivery';
    } else {
      double missingAmt = 3001.00 - subtotal;
      return 'Add item worth NRs $missingAmt or more and \nget a "FREE Delivery" worth NRs 500/-';
    }
  }

  String get grandTotalString => grandTotal.toStringAsFixed(2);
  String get subTotalString => subtotal.toStringAsFixed(2);
  String get deliveryFeeString => deliveryFee(subtotal).toStringAsFixed(2);
  String get freeDeliveryString => freeDelivery(subtotal);

  List<Product> products = [
    const Product(
      'Ashwagandha',
      'Immunity',
      'Enhance your power',
      'https://m.media-amazon.com/images/I/61uVcAti5mL._AC_SL1500_.jpg',
      1070,
      true,
      false,
      "Ashwagandha Tea is an evergreen shrub that grows in Asia and Africa. It is commonly used for stress. There is little evidence for its use as an adaptogen. \nAshwagandha contains chemicals that might help calm the brain, reduce swelling, lower blood pressure, and alter the immune system.\nSince ashwagandha is traditionally used as an adaptogen, it is used for many conditions related to stress. Adaptogens are believed to help the body resist physical and mental stress. Some of the conditions it is used for include insomnia, aging, anxiety and many others, but there is no good scientific evidence to support most of these uses. There is also no good evidence to support using ashwagandha for COVID-19.\nDon't confuse ashwagandha with Physalis alkekengi. Both are known as winter cherry. Also, don't confuse ashwagandha with American ginseng, Panax ginseng, or eleuthero.",
    ),
    const Product(
      'Silajit',
      'Immunity',
      'Enhance your power',
      'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
      1070,
      true,
      true,
      "",
    ),
    const Product(
      'Ayur Slim Cutter Herbal Tea',
      'Natural',
      "In nature's embrace",
      "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
      530,
      false,
      true,
      "",
    ),
    // const Product(
    //   'Tulsi Tea',
    //   'Natural',
    //   "In nature's embrace",
    //   "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
    //   530,
    //   true,
    //   false,
    //   "",
    // ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
