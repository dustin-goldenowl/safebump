import 'package:flutter/material.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';

class XFillButton extends StatelessWidget {
  const XFillButton(
      {super.key,
      required this.label,
      this.bgColor = AppColors.primary,
      this.onPressed,
      this.borderRadius = AppRadius.r8,
      this.border});
  final Widget label;
  final Color bgColor;
  final double borderRadius;
  final BorderSide? border;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              side: border ?? BorderSide.none,
              borderRadius: BorderRadius.circular(borderRadius))),
          backgroundColor: MaterialStateProperty.all(bgColor)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [label],
      ),
    );
  }
}
