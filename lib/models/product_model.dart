import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name, category, imgUrl;
  final String details;
  final double price;
  final bool isRecommended, isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imgUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    required this.details,
  });

  static Product fromSnapshot(DocumentSnapshot snap) {
    var p = snap['price'];
    Product product = Product(
      name: snap['name'],
      category: snap['category'],
      imgUrl: snap['imgUrl'],
      price: p.toDouble(),
      isRecommended: snap['isRecommended'],
      isPopular: snap['isPopular'],
      details: snap['details'],
    );
    // log(product.toString());
    // log(p.runtimeType.toString());
    return product;
  }

  @override
  List<Object?> get props => [
        name,
        category,
        imgUrl,
        price,
        isPopular,
        isRecommended,
        details,
      ];

//creating a list for products
  static List<Product> products = [
    const Product(
      name: 'Ashwagandha',
      category: 'Immunity',
      // 'Enhance your power',
      imgUrl: 'https://m.media-amazon.com/images/I/61uVcAti5mL._AC_SL1500_.jpg',
      price: 1070,
      isRecommended: true,
      isPopular: false,
      details:
          "Ashwagandha Tea is an evergreen shrub that grows in Asia and Africa. It is commonly used for stress. There is little evidence for its use as an adaptogen. \nAshwagandha contains chemicals that might help calm the brain, reduce swelling, lower blood pressure, and alter the immune system.\nSince ashwagandha is traditionally used as an adaptogen, it is used for many conditions related to stress. Adaptogens are believed to help the body resist physical and mental stress. Some of the conditions it is used for include insomnia, aging, anxiety and many others, but there is no good scientific evidence to support most of these uses. There is also no good evidence to support using ashwagandha for COVID-19.\nDon't confuse ashwagandha with Physalis alkekengi. Both are known as winter cherry. Also, don't confuse ashwagandha with American ginseng, Panax ginseng, or eleuthero.",
    ),
    const Product(
      name: 'Silajit',
      category: 'Immunity',
      // 'Enhance your power',
      imgUrl:
          'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
      price: 1070,
      isRecommended: true,
      isPopular: true,
      details: "",
    ),
    const Product(
      name: 'Ayur Slim Cutter Herbal Tea',
      category: 'Natural',
      // "In nature's embrace",
      imgUrl:
          "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
      price: 530,
      isRecommended: false,
      isPopular: true, details: "",
    ),
    const Product(
      name: 'Tulsi Tea',
      category: 'Natural',
      // "In nature's embrace",
      imgUrl:
          "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
      price: 530,
      isRecommended: true,
      isPopular: false,
      details: "",
    ),
    const Product(
      name: 'Relaxing tea',
      category: 'Immunity',
      // 'Enhance your power',
      imgUrl: 'https://m.media-amazon.com/images/I/61uVcAti5mL._AC_SL1500_.jpg',
      price: 530,
      isRecommended: true,
      isPopular: false,
      details: "",
    ),
    const Product(
      name: 'Black memory',
      category: 'Mental power',
      // 'Enhance your power',
      imgUrl:
          'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
      price: 670,
      isRecommended: true,
      isPopular: true,
      details: "",
    ),
  ];
}
