import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/core/startup/injection.dart';
import 'package:login/core/widget/bottom_navigation.dart';
import 'package:login/features/customers/data/repository/customer_repository.dart';
import 'package:login/features/customers/presentation/bloc/customer_bloc.dart';
import 'package:login/features/customers/presentation/customers_list/screen/customers_list.dart';
import 'package:login/features/dashboard/presentation/home.dart';
import 'package:login/features/order/presentation/bloc/product/products_list_bloc.dart';
import 'package:login/features/order/presentation/order_list/screen/orders.dart';
import 'package:login/features/setting/presentation/setting.dart';


class AppBootStrap extends StatefulWidget {
  const AppBootStrap({super.key});

  @override
  State<AppBootStrap> createState() => _AppBootStrapState();
}

const int homeIndex = 0;
const int orderIndex = 1;
const int customerIndex = 2;
const int settingIndex = 3;

//ناقص هنوز کامل نکردم
class _AppBootStrapState extends State<AppBootStrap> {
  // TotalPrice totalPrice = TotalPrice(0, 0, 0);
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ProductsListBloc>()),
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