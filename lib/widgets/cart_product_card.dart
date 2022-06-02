import 'package:ecommerce_app/models/models.dart';
import 'package:ecommerce_app/support_functions/icon_button.dart';
import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  final Product product;
  const CartProductCard({Key? key, required this.product}) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  int _qty = 1;

  void _qtyIncrementCounter() {
    setState(() {
      _qty++;
    });
  }

  void _qtyDecrementCounter() {
    setState(() {
      _qty--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(
            widget.product.imgUrl,
            width: 100,
            height: 80,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 230,
                  child: Text(widget.product.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4),
                ),
                Text(
                  "NRs ${widget.product.price.toString()}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          _itemQuantityIncreaser(context),
        ],
      ),
    );
  }

  _itemQuantityIncreaser(context) {
    return Row(
      children: [
        iconButton(() {
          if (_qty > 1) {
            _qtyDecrementCounter();
          } else {
            _qty = 1;
          }
        }, context, Icons.remove_circle, Colors.red),
        const SizedBox(width: 10),
        Text('$_qty', style: Theme.of(context).textTheme.headline4),
        const SizedBox(width: 10),
        iconButton(() {
          _qtyIncrementCounter();
        }, context, Icons.add_circle, Colors.green),
      ],
    );
  }
}
