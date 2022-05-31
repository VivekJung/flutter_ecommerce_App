import 'package:ecommerce_app/models/models.dart';
import 'package:flutter/material.dart';

class HeroCarousalCard extends StatelessWidget {
  final Category? category;
  final Product? product;

  const HeroCarousalCard({Key? key, this.category, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        product == null
            ? Navigator.pushNamed(context, '/catalog', arguments: category)
            : Navigator.pushNamed(context, '/catalog', arguments: product);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(2.0)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  product == null ? category!.imgUrl : product!.imgUrl,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 20.0),
                    child: Text(
                        product == null ? category!.name : product!.alias,
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(color: Colors.white)),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
