
import 'package:flutter/material.dart';

class BottomNavigationItem extends StatelessWidget {
  final String iconFileName;
  final String title;
  final String activeIconFileName;
  final Function() onTap;

  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.title,
    required this.activeIconFileName, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/icons/$iconFileName',
              width: 70,
             
            ),
          ),
          //SizedBox(height: 0),
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleSmall!.copyWith(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}