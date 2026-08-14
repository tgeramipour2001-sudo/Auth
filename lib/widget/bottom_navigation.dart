import 'package:flutter/material.dart';
import 'package:login/widget/bottom_navigation_item.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

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
        padding: const EdgeInsets.only(top: 8, bottom: 12),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavigationItem(
              iconFileName: 'setting1_icon.png',
              title: 'Setting',
              activeIconFileName: 'Setting',
            ),

            BottomNavigationItem(
              iconFileName: 'customer_icon.png',
              title: 'Customer',
              activeIconFileName: 'Customer',
            ),

            BottomNavigationItem(
              iconFileName: 'order_icon.png',
              title: 'Order',
              activeIconFileName: 'Customer',
            ),

            BottomNavigationItem(
              iconFileName: 'home_icon.png',
              title: 'Home',
              activeIconFileName: 'Customer',
            ),
          ],
        ),
      ),
    );
  }
}
