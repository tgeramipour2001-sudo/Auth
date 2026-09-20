import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/core/startup/injection.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';
import 'package:login/features/order/domain/entity/product_entity/cart_item_entity.dart';
import 'package:login/features/order/domain/entity/product_entity/product_entity.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:login/features/order/presentation/product/logic/decrease_count.dart';
import 'package:login/features/order/presentation/product/logic/increase_count.dart';


class ProductCountChangeBox extends StatefulWidget {
  final ProductEntity product;
  final CustomerEntity customer;

  const ProductCountChangeBox({
    super.key,
    required this.product,
    required this.customer,
  });

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
              getIt<ProductsListBloc>().add(
                ProductClicked(
                  customer: widget.customer,
                  product: CartItemEntity(
                    widget.product,
                    int.parse(productCount.text),
                  ),
                ),
              );
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

              getIt<ProductsListBloc>().add(
                ProductClicked(
                  customer: widget.customer,
                  product: CartItemEntity(
                    widget.product,
                    int.parse(productCount.text),
                  ),
                ),
              );
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

              getIt<ProductsListBloc>().add(
                ProductClicked(
                  customer: widget.customer,
                  product: CartItemEntity(
                    widget.product,
                    int.parse(productCount.text),
                  ),
                ),
              );
            });
          },
          child: Icon(CupertinoIcons.plus, color: Colors.white, size: 15),
        ),
      ],
    );
  }
}
