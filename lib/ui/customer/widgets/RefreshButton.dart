
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        CupertinoIcons.refresh_bold,
        color: Colors.white70,
      ),
    );
  }
}
