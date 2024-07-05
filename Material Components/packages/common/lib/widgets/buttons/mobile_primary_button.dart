
import 'package:common/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  });

  @override
  Widget build(BuildContext context) {
    //final color = Theme.of(context).mainAppColors;

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        decoration: BoxDecoration(
          boxShadow: boxShadow,
          borderRadius: BorderRadius.circular(borderRadius ?? 0.r),
          color: buttonColor ?? Colors.green,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1.w,
                )
              : Border.all(
            color: Colors.white,
            width: 1.w,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox.shrink(),
            icon != null
                ? SizedBox(
                    width: 10.w,
                  )
                : const SizedBox(),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: verticalTextPadding ?? 16.h),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: textColor ?? Colors.white,
                    fontSize: fontSize ?? 16.sp,
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
