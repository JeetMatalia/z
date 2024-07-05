import 'package:flutter/material.dart';

enum ButtonType {
  elevated,
  filled,
  tonal,
  outlined,
  text,
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final Color? color;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool? autofocus;
  final Clip? clipBehavior;
  final MaterialStatesController? statesController;
  final Widget? icon;
  final Widget? label;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.type,
    this.color,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.icon,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            backgroundColor: color,
          ),
        );

      case ButtonType.filled:
        return FilledButton(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: color,
          ),
        );
      case ButtonType.tonal:
        return FilledButton.tonal(
          onPressed: onPressed,
          child: Text(text),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor:
                color ?? Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        );
      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          child: Text(text),
          style: OutlinedButton.styleFrom(
            foregroundColor: color ?? Theme.of(context).primaryColor,
          ),
        );
      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          child: Text(text),
          style: TextButton.styleFrom(
            foregroundColor: color ?? Theme.of(context).primaryColor,
          ),
        );
      default:
        return ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        );
    }
  }
}
