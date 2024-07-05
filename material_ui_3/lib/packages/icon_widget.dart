import 'package:flutter/material.dart';

enum IconButtonType {
  normal,
  filled,
  filledTonal,
  outlined,
}

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final IconButtonType type;
  final Color? color;

  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.type,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case IconButtonType.filled:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color ),
        );
      case IconButtonType.filledTonal:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color ),
        );
      case IconButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          child: Icon(icon, color: color ),
        );
      default:
        return IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: color),
        );
    }
  }
}
