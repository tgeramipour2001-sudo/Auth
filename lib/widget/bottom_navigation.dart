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
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        child: const Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavigationItem(
              iconFileName: 'setting_icon.png',
              title: 'setting',
              activeIconFileName: 'Setting',
            ),
        
             BottomNavigationItem(
              iconFileName: 'setting_icon.png',
              title: 'customer',
              activeIconFileName: 'Customer',
            ),
          ],
        ),
      ),
    );
  }
}

