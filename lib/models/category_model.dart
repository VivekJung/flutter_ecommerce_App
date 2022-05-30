import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name, alias;
  final String imgUrl;

  const Category({
    required this.name,
    required this.alias,
    required this.imgUrl,
  });

  @override
  List<Object?> get props => [name, imgUrl];

  static List<Category> categories = [
    const Category(
        // immune booster
        alias: "Enhance your power",
        name: "Immunity",
        imgUrl:
            "https://us.123rf.com/450wm/vicushka/vicushka1812/vicushka181200126/113758670-herbal-turmeric-tea-background-cup-of-healthy-turmeric-spice-tea-with-iron-teapot-and-ingredients-le.jpg?ver=6"),
    const Category(
      //natural beverages
      alias: "In nature's embrace",
      name: "Natural",
      imgUrl:
          "https://img.freepik.com/free-photo/two-glasses-red-wine-tasty-cheese-plate-with-fruit-grape-nuts-toasted-bread-wooden-kitchen-plate-black-stone-background_155003-32341.jpg?t=st=1653883816~exp=1653884416~hmac=19c4f962a3d1f6e700adfc0c4ca5158cb83bd51d64c9739fae26f6eefac1203e&w=740",
    ),
    const Category(
      // soothing and relaxing
      alias: "Sooth thy self ",
      name: "Relaxing",
      imgUrl:
          "https://img.freepik.com/free-photo/beautiful-ceramic-teapot-concrete-background-top-view-copy-space_169016-17128.jpg?t=st=1653883983~exp=1653884583~hmac=266bf84a026d45a169e85aeda5669846b160a21d2880859c1f019fa556d19a41&w=740",
    ),
    const Category(
      //brain power improvement
      alias: "Embrace the brilliance",
      name: "Mental power",
      imgUrl:
          "https://img.freepik.com/free-photo/brain-writes-with-white-chalk-is-hand-draw-concept_1150-19556.jpg?t=st=1653884114~exp=1653884714~hmac=194426e834888989e377a7c26b4fcc2410d81a3dbd5fae3052cead11fd67ccbc&w=740",
    ),
  ];
}
