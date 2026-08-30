import 'package:flutter/material.dart';

class RefreshButtonProductsList extends StatelessWidget {
  final GestureTapCallback onTap;
  const RefreshButtonProductsList({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset('assets/icons/refresh_icon.png', width: 50),
    );
  }
}
