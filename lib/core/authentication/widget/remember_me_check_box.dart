import 'package:flutter/material.dart';

class RememberMe extends StatefulWidget {
  final ValueChanged<bool> saveInfoChanged;

  const RememberMe({super.key, required this.saveInfoChanged});
  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  bool saveInfo = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          fillColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.white70;
            }

            return Colors.transparent;
          }),

          checkColor: const Color(0xff204680),

          side: WidgetStateBorderSide.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const BorderSide(color: Colors.white70, width: 1);
            }

            return const BorderSide(color: Color(0xff204680), width: 2);
          }),

          value: saveInfo,

          onChanged: (value) {
            setState(() {
              saveInfo = value ?? false;
            });

            widget.saveInfoChanged(saveInfo);
          },
        ),

        Text(
          'remember me',
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: Colors.white70),
        ),
      ],
    );
  }
}
