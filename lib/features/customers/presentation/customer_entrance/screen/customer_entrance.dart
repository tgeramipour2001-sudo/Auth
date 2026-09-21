import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/customer/widget/balance_box.dart';
import 'package:login/core/customer/widget/customer_address_box.dart';
import 'package:login/core/customer/widget/customer_name_box.dart';
import 'package:login/features/customers/domain/entity/customer_entity.dart';
import 'package:login/features/customers/presentation/customer_entrance/widget/customer_image.dart';
import 'package:login/features/customers/presentation/customer_entrance/widget/map.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:login/features/order/presentation/product/screen/products_list.dart';


class CustomerEntranceScreen extends StatelessWidget {
  final CustomerEntity customerEntity;
  const CustomerEntranceScreen({super.key, required this.customerEntity});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.white54)],
        ),

        child: Column(
          children: [
            Container(
              height: 160,
              margin: EdgeInsets.only(top: 10, bottom: 5, left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomerImage(imageFileName: customerEntity.imageFileName),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomerNameBox(
                        customer: customerEntity,
                        containerColor: Color(0xff204680),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(color: Colors.grey, indent: 2, endIndent: 2),

            Container(
              margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
              decoration: BoxDecoration(
                color: Color(0xff88A9DC).withValues(alpha: 5),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Color(0xff204680), blurRadius: 7)],
              ),
              child: Column(
                children: [
                  Text(
                    'Address:',
                    style: Theme.of(context).textTheme.headlineMedium!.apply(
                      color: Colors.black.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomerAddressBox(
                        customer: customerEntity,
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                    ],
                  ),

                  Divider(color: Colors.white70, indent: 2, endIndent: 2),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BalanceBox(
                        customer: customerEntity,
                        title: 'Credite Balance',
                        detail: customerEntity.creditBalance.toString(),
                        color: Colors.black.withValues(alpha: 0.7),
                      ),

                      BalanceBox(
                        customer: customerEntity,
                        title: 'Account Balance',
                        detail: customerEntity.accountBalance.toString(),
                        color: Colors.black.withValues(alpha: 0.7),
                      ),

                      BalanceBox(
                        customer: customerEntity,
                        title: 'Last Order Date',
                        detail: customerEntity.lastOrderDate,
                        color: Colors.black.withValues(alpha: 0.7),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.white70, indent: 2, endIndent: 2),
                  SizedBox(height: 5),
                  CustomerMap(
                    latitude: customerEntity.latitude,
                    longitude: customerEntity.longtitude,
                  ),

                  SizedBox(height: 25),
                  //ٍEntrance button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          final productsBloc = context.read<ProductsListBloc>();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: productsBloc,
                                child: ProductsListScreen(
                                  customer: customerEntity,
                                ),
                              ),
                            ),
                          );
                        },
                        child: Expanded(
                          child: Image.asset(
                            'assets/icons/order1_icon.png',
                            width: 60,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                        width: MediaQuery.of(context).size.width / 4.5,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            'Enter',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}