
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RefreshButton({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Image.asset('assets/icons/refresh_icon.png', width: 50,),
    );
  }
}
