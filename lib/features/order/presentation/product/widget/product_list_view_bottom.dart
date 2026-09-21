import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';
import 'package:login/features/order/domain/entity/order_cart_entity/cart_entity.dart';
import 'package:login/features/order/presentation/order_cart/screen/cart.dart';


class ProductListViewBottom extends StatelessWidget {
  final CartEntity customerOrder;
  final CustomerEntity customerEntity;
  final Color containerColor = Color(0xff204680);
  ProductListViewBottom({super.key, required this.customerOrder, required this.customerEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 3, 20, 3),
      height: 100,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: containerColor,
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gross Amount: ${customerOrder.totalPrice.grossAmount}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Discount: ${customerOrder.totalPrice.discountAmount}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Net payable: ${customerOrder.totalPrice.netPayableAmount} ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen(customer: customerEntity,customerOrder: customerOrder,)),
              );
            },
            child: Icon(CupertinoIcons.forward, size: 32, color: Colors.white),
          ),
        ],
      ),
    );
  }
}