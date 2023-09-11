import 'package:flutter/material.dart';

class WithIconButton extends StatelessWidget {
  const WithIconButton({
    super.key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.isOn = true,
    this.selectedColor,
  });

  final IconData icon;
  final String text;
  final Function()? onPressed;
  final bool isOn;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              size: 48,
              color: isOn ? selectedColor ?? Colors.black : Colors.black),
          Text(
            text,
          ),
        ],
      ),
    );
  }
}
