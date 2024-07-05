
import 'package:common/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthButtons extends StatelessWidget {
  final Widget authIcon;
  final String buttonLabel;
  final Color borderColor;
  final Color textColor;
  final String? fontFamily;
  final Function() onTap;

  const AuthButtons({
    Key? key,
    required this.authIcon,
    required this.buttonLabel,
    required this.borderColor,
    required this.textColor,
    required this.onTap,
     this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).mainAppColors;
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: 60.h,
        width: 156.w,
        decoration: BoxDecoration(
          color: color.white,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(8.w),
          boxShadow: [
            BoxShadow(
              color: color.black.withOpacity(0.06),
              blurRadius: 25.r,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            authIcon,
            SizedBox(width: 12.w,),
            Text(buttonLabel,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: textColor,
            ),)
          ],
        ),
      ),
    );
  }
}
