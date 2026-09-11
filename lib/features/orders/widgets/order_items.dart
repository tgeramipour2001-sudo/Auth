import 'package:flutter/material.dart';
import 'package:login/features/products/entity/customer_order.dart';

class OrderItems extends StatelessWidget {
  final CustomerOrder customerOrder;
  const OrderItems({super.key, required this.customerOrder});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,

      child: ListView.builder(
        itemCount: customerOrder.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: Colors.white70.withValues(alpha: 0.88),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 3)],
              ),
              width: MediaQuery.sizeOf(context).width,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customerOrder.products[index].product.name,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Divider(height: 1,),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: 60,
                          child: Column(
                            children: [
                              Text('Unit'),
                              Divider(),

                              Text(customerOrder.products[index].product.unit),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: 60,
                          child: Column(
                            children: [
                              Text('Count'),
                              Divider(),

                              Text(
                                customerOrder.products[index].count.toString(),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(
                          width: MediaQuery.sizeOf(context).width / 5,
                          height: 60,
                          child: Column(
                            children: [
                              Text('Price'),
                              Divider(),

                              Text(
                                customerOrder.products[index].product.price
                                    .toString(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
