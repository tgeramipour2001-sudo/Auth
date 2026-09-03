import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/products/entity/product.dart';
import 'package:login/features/products/widgets/product_count_change_box.dart';

class ProductListView extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final Color containerColor = Color.fromARGB(255, 129, 140, 157);
    final theme = Theme.of(context);
    return ListView.builder(
      //padding: EdgeInsets.all(20),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        ProductEntity product = products[index];
        return Container(
          margin: EdgeInsets.fromLTRB(8, 10, 8, 5),
          width: MediaQuery.sizeOf(context).width,
          height: 205,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 215, 221, 229),
            boxShadow: [BoxShadow(blurRadius: 4, color: containerColor)],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 10, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('Unit: ${product.unit}'),
                      Text('Stock: ${product.stock}'),
                      Text('Warehouse: ${product.warehouse}'),
                      Text('price: ${product.price} '),
                      Text('discount: ${product.discount} '),

                      SizedBox(height: 6),
                     ProductCountChangeBox(product: product,)
                    ],
                  ),
                ),
              ),
              ClipRRect(
                child: Image.asset(
                  product.fileName,
                  width: 100,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
