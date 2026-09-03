import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/products/entity/product.dart';
import 'package:login/features/products/functions/decrease_count.dart';
import 'package:login/features/products/functions/increase_count.dart';

class ProductCountChangeBox extends StatefulWidget {
  final ProductEntity product;

  const ProductCountChangeBox({super.key, required this.product});

  @override
  State<ProductCountChangeBox> createState() => _ProductCountChangeBoxState();
}

class _ProductCountChangeBoxState extends State<ProductCountChangeBox> {
  TextEditingController productCount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(20, 25),
            shape: CircleBorder(),
          ),
          onPressed: () {
            setState(() {
              productCount.text = DeceaseCount(productCount.text, 0);
            });
          },
          child: Icon(CupertinoIcons.minus, color: Colors.white, size: 15),
        ),

        SizedBox(
          width: 30,
          height: 30,
          child: TextField(
            onChanged: (value) {
              int count = int.tryParse(value) ?? 0;
              if (count > widget.product.stock) {
                productCount.text = widget.product.stock.toString();
              }
            },
            controller: productCount,
            keyboardType: TextInputType.numberWithOptions(),
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
          ),
        ),

        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(20, 25),
            shape: CircleBorder(),
          ),
          onPressed: () {
            setState(() {
              productCount.text = IncreaseCount(
                productCount.text,
                widget.product.stock,
              );
            });
          },
          child: Icon(CupertinoIcons.plus, color: Colors.white, size: 15),
        ),
      ],
    );
  }
}
