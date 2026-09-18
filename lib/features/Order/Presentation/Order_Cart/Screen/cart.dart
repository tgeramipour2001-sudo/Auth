import 'package:flutter/material.dart';
import 'package:login/Features/Customers/Domain/Entity/customer_entity.dart';
import 'package:login/Features/Order/Domain/Entity/Order_Cart_Entity/cart_entity.dart';
import 'package:login/Features/Order/Presentation/Order_Cart/Widget/cart_bottom.dart';

import 'package:login/Features/Order/Presentation/Order_Cart/Widget/selected_tab_screen.dart';


class CartScreen extends StatefulWidget {
  final CustomerEntity customer;
  final CartEntity customerOrder;
  const CartScreen({
    super.key,
    required this.customer,
    required this.customerOrder,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Color(0xff88A9DC),
                    boxShadow: [BoxShadow(blurRadius: 5, color: Colors.grey)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.customer.name,
                          style: Theme.of(context).textTheme.headlineMedium!
                              .copyWith(fontSize: 27, color: Color(0xff204680)),
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedTab = 0;
                                });
                              },
                              child: Text(
                                'Order items',
                                style: selectedTab != 0
                                    ? Theme.of(context).textTheme.titleSmall!
                                          .copyWith(fontWeight: FontWeight(600))
                                    : Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight(600),
                                        color: Color(0xff204680),
                                        fontSize: 16,
                                      ),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedTab = 1;
                                });
                              },
                              child: Text(
                                'Invoice',
                                style: selectedTab != 1
                                    ? Theme.of(context).textTheme.titleSmall!
                                          .copyWith(fontWeight: FontWeight(600))
                                    : Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight(600),
                                        color: Color(0xff204680),
                                        fontSize: 16,
                                      ),
                              ),
                            ),

                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedTab = 2;
                                });
                              },
                              child: Text(
                                'Comment',
                                style: selectedTab != 2
                                    ? Theme.of(context).textTheme.titleSmall!
                                          .copyWith(fontWeight: FontWeight(600))
                                    : Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontWeight: FontWeight(600),
                                        color: Color(0xff204680),
                                        fontSize: 16,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: selectedTabScreen(
                    selectedTab,
                    widget.customerOrder,
                    widget.customer.id,
                  ),
                ),
              ],
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CartBottom(
                customerId: widget.customer.id,
                customerOrder: widget.customerOrder,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
