import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/features/customers/entity/customer.dart';
import 'package:login/features/products/entity/total_price.dart';
import 'package:login/features/products/presentation/save_order.dart';

class ProductListViewBottom extends StatelessWidget {
  final CustomerEntity customer;
  final TotalPrice totalPrice;
  final Color containerColor = Color(0xff204680);
  ProductListViewBottom({super.key, required this.totalPrice, required this.customer});

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
                'Gross Amount: ${totalPrice.grossAmount}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Discount: ${totalPrice.discountAmount}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                'Net payable: ${totalPrice.netPayableAmount} ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),

          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SaveOrder(customer: customer,)),
              );
            },
            child: Icon(CupertinoIcons.forward, size: 32, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
