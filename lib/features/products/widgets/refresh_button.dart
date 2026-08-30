import 'package:flutter/material.dart';

class RefreshButtonProductsList extends StatelessWidget {
  const RefreshButtonProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.asset('assets/icons/refresh_icon.png', width: 50),
    );
  }
}
