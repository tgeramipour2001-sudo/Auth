import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/features/customers/bloc/customer_bloc.dart';
import 'package:login/features/customers/data/repository/customer_repository.dart';
import 'package:login/features/customers/presentation/customers_list/customersList.dart';
import 'package:login/features/home/presentation/home.dart';
import 'package:login/features/orders/orders.dart';
import 'package:login/features/products/bloc/products_list_bloc.dart';
import 'package:login/features/products/data/repository/product_list_repository.dart';
import 'package:login/features/products/entity/total_price.dart';
import 'package:login/features/setting/setting.dart';
import 'package:login/core/widget/bottom_navigation.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

const int homeIndex = 0;
const int orderIndex = 1;
const int customerIndex = 2;
const int settingIndex = 3;

//ناقص هنوز کامل نکردم
class _MainscreenState extends State<Mainscreen> {
  TotalPrice totalPrice = TotalPrice(0, 0, 0);
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsListBloc>(
          create: (context) {
            final ProductsBloc = ProductsListBloc(
              productListRepository: productListRepository,
              totalPrice: totalPrice
            );
            ProductsBloc.add(ProductListStarted());
            return ProductsBloc;
          },
        ),
        BlocProvider<CustomerBloc>(
          create: (context) {
            final CustomersBloc = CustomerBloc(
              customerRepository: customerRepository,
            );
            CustomersBloc.add(CustomerStarted());
            return CustomersBloc;
          },
        ),
      ],

      child: Scaffold(
        bottomNavigationBar: BottomNavigation(
          onTap: (int index) {
            setState(() {
              selectedScreenIndex = index;
            });
          },
        ),
        body: IndexedStack(
          index: selectedScreenIndex,
          children: [
            HomeScreen(),
            OrdersListScreen(),
            CustomersListScreen(),
            SettingScreen(),
          ],
        ),
      ),
    );
  }
}
