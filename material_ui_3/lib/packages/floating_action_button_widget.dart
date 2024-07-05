import 'package:flutter/material.dart';

enum FloatingActionButtonSize {
  small,
  normal,
  large,
}

class CustomFAB extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final FloatingActionButtonSize size;

  const CustomFAB({
    Key? key,
    required this.onPressed,
    required this.child,
    this.size = FloatingActionButtonSize.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double sizeValue = 40.0; // Default size for normal FAB

    switch (size) {
      case FloatingActionButtonSize.small:
        sizeValue = 20.0;
        break;
      case FloatingActionButtonSize.large:
        sizeValue = 60.0;
        break;
      default:
        break;
    }

    return SizedBox(
      width: sizeValue,
      height: sizeValue,
      child: FloatingActionButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
