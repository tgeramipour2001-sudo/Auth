
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RefreshButton({
    super.key, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        CupertinoIcons.refresh_thin,
        size: 30,
        color: Colors.white70,
      ),
    );
  }
}
