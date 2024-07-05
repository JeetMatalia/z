library mobileprimarybutton;

import 'package:flutter/material.dart';

class MobilePrimaryButton extends StatelessWidget {
  final String buttonText;
  final Color? buttonColor;
  final double? verticalTextPadding;
  final void Function() onTap;
  final Color? borderColor;
  final double? fontSize;
  final Color? textColor;
  final double? borderRadius;
  final double? buttonHeight;
  final double? buttonWidth;
  final Widget? icon;
  final bool? isDisable;
  final FontWeight? fontWeight;
  final List<BoxShadow>? boxShadow;

  const MobilePrimaryButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    this.verticalTextPadding,
    this.borderColor,
    this.fontWeight,
    this.fontSize,
    this.icon,
    this.boxShadow,
    this.textColor,
    this.buttonColor,
    this.borderRadius,
    this.buttonHeight,
    this.isDisable,
    this.buttonWidth
  });

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          color: buttonColor ,
          border: borderColor != null
              ? Border.all(
            color: borderColor!,
            width: buttonWidth??1,
          )
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(
              width: buttonWidth??1,
            )
                : SizedBox(),
            Padding(
              padding:
              EdgeInsets.symmetric(vertical: verticalTextPadding ?? 16),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor ,
                    fontSize: fontSize ?? 16,
                    fontWeight: fontWeight??FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
