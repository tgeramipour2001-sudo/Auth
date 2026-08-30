import 'package:flutter/material.dart';
import 'package:login/features/products/entity/product.dart';

class ProductListView extends StatelessWidget {
  final List<ProductEntity> products;
  ProductListView({super.key, required this.products});

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
          height: 130,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color.fromARGB(255, 215, 221, 229),
            boxShadow: [BoxShadow(blurRadius: 4, color: containerColor)],
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name, style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
                    SizedBox(height: 5,),
                    Text('Unit: ${product.unit}'),
                    Text('Stock: ${product.stock}'),
                    Text('Warehouse: ${product.warehouse}')
                  ],
                ),
              ),
              Expanded(child: Image.asset('assets/icons/setting_icon.png',width: 180,)),
            ],
          ),
        );
      },
    );
  }
}
