import 'package:flutter/material.dart';
import 'package:login/widget/bottom_navigation_item.dart';

const int homeIndex = 0;
const int orderIndex = 1;
const int customerIndex = 2;
const int settingIndex = 3;

class BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  const BottomNavigation({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final Color bottomNavigationColor = Color(0xff204680);
    final theme = Theme.of(context);
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 75,
      decoration: BoxDecoration(
        color: bottomNavigationColor,
        boxShadow: [BoxShadow(blurRadius: 3)],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavigationItem(
              iconFileName: 'setting1_icon.png',
              title: 'Setting',
              activeIconFileName: 'Setting',
              onTap: () {
                onTap(settingIndex);
              },
            ),

            BottomNavigationItem(
              iconFileName: 'customer_icon.png',
              title: 'Customer',
              activeIconFileName: 'Customer',
              onTap: () {
                onTap(customerIndex);
              },
            ),

            BottomNavigationItem(
              iconFileName: 'order_icon.png',
              title: 'Order',
              activeIconFileName: 'Customer',
              onTap: () {
                onTap(orderIndex);
              },
            ),

            BottomNavigationItem(
              iconFileName: 'home_icon.png',
              title: 'Home',
              activeIconFileName: 'Customer',
              onTap: () {
                onTap(homeIndex);
              },
            ),
          ],
        ),
      ),
    );
  }
}
