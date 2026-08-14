import 'package:flutter/material.dart';
import 'package:login/ui/customers/customersList.dart';
import 'package:login/ui/home.dart';
import 'package:login/ui/order/orders.dart';
import 'package:login/ui/setting/setting.dart';
import 'package:login/widget/bottom_navigation.dart';

class Mainscreen extends StatelessWidget{
  const Mainscreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      bottomNavigationBar: BottomNavigation(),
      body: IndexedStack(

        index: 0,
        children: [
          HomeScreen(),
          OrdersListScreen(),
          CustomersListScreen(),
          SettingScreen()
        ],
      ),
    );
  }
}