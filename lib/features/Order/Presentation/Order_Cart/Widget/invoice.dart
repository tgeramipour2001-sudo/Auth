import 'package:flutter/material.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';

class Invoice extends StatelessWidget {
  final CartEntity customerOrder;
  const Invoice({super.key, required this.customerOrder});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: Colors.white70.withValues(alpha: 0.88),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    'Gross Amount: ${customerOrder.totalPrice.grossAmount.toString()}',
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Discount Amount: ${customerOrder.totalPrice.discountAmount.toString()}',
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Netpayable Amount Price: ${customerOrder.totalPrice.netPayableAmount.toString()}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
