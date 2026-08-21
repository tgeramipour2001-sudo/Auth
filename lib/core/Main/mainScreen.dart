import 'package:flutter/material.dart';
import 'package:login/features/customers/presentation/customersList.dart';
import 'package:login/features/home/presentation/home.dart';
import 'package:login/features/orders/orders.dart';
import 'package:login/features/setting/setting.dart';
import 'package:login/core/widget/bottom_navigation.dart';

class Mainscreen extends StatefulWidget{
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
  int selectedScreenIndex = homeIndex;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      bottomNavigationBar: BottomNavigation(onTap: (int index) { 
        setState(() {
          selectedScreenIndex = index;
        });
       },),
      body: IndexedStack(

        index: selectedScreenIndex,
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