import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name, category, imageUrl, alias;
  final double price;
  final bool isRecommended, isPopular;

  const Product(
    this.name,
    this.category,
    this.alias,
    this.imageUrl,
    this.price,
    this.isRecommended,
    this.isPopular,
  );
  @override
  List<Object?> get props => [
        name,
        category,
        alias,
        imageUrl,
        price,
        isPopular,
        isRecommended,
      ];

  //creating a list for products
  static List<Product> products = [
    const Product(
        'Ashwagandha',
        'Immunity',
        'Enhance your power',
        'https://m.media-amazon.com/images/I/61uVcAti5mL._AC_SL1500_.jpg',
        1070,
        true,
        false),
    const Product(
        'Silajit',
        'Immunity',
        'Enhance your power',
        'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
        1070,
        true,
        true),
    const Product(
        'Ayur Slim Tea',
        'Natural',
        "In nature's embrace",
        "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
        530,
        false,
        true),
    const Product(
        'Tulsi Tea',
        'Natural',
        "In nature's embrace",
        "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
        530,
        true,
        false),
    const Product(
        'Relaxing tea',
        'Immunity',
        'Enhance your power',
        'https://m.media-amazon.com/images/I/61uVcAti5mL._AC_SL1500_.jpg',
        530,
        true,
        false),
    const Product(
        'Black memory',
        'Mental power',
        'Enhance your power',
        'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
        670,
        true,
        true),
    const Product(
        'Ayur Green Tea',
        'Relaxing',
        "In nature's embrace",
        "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
        470,
        false,
        true),
    const Product(
        'Tulsi Tea',
        'Relaxing',
        "In nature's embrace",
        "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
        530,
        true,
        false),
    const Product(
        'Black memory',
        'Immunity',
        'Enhance your power',
        'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
        670,
        true,
        true),
    const Product(
        'Ayur Green Tea',
        'Immunity',
        "In nature's embrace",
        "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
        470,
        false,
        true),
    const Product(
        'Tulsi Tea',
        'Immunity',
        "In nature's embrace",
        "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
        530,
        true,
        false),
    const Product(
        'Black memory',
        'Immunity',
        'Enhance your power',
        'https://5.imimg.com/data5/SELLER/Default/2021/4/BP/DG/FH/99454184/whatsapp-image-2021-04-20-at-2-52-16-pm-500x500.jpeg',
        670,
        true,
        true),
    const Product(
        'Ayur Green Tea',
        'Immunity',
        "In nature's embrace",
        "https://grandbazaronline.com/wp-content/uploads/2020/12/HIMALAYA-AYUR-SLIM-TEA-BAG-10S.jpg",
        470,
        false,
        true),
    const Product(
        'Tulsi Tea',
        'Immunity',
        "In nature's embrace",
        "https://freshconnection.s3.amazonaws.com/media/public/product/Glendale_Tulsi_Tea_Canister_FOP.jpg",
        530,
        true,
        false),
  ];
}
