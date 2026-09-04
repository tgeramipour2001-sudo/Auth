import 'package:flutter/material.dart';
import 'package:login/features/customers/entity/customer.dart';
import 'package:login/features/products/widgets/selected_tab_screen.dart';

class SaveOrder extends StatefulWidget {
  final CustomerEntity customer;
  const SaveOrder({super.key, required this.customer});

  @override
  State<SaveOrder> createState() => _SaveOrderState();
}

class _SaveOrderState extends State<SaveOrder> {
  int selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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

            Expanded(child: selectedTabScreen(selectedTab)),
          ],
        ),
      ),
    );
  }
}
