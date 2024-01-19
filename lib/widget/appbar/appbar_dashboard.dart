import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';

class XAppBarDashboard extends StatelessWidget {
  const XAppBarDashboard(
      {super.key,
      required this.title,
      this.titleStyle = const TextStyle(
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f16,
          color: AppColors.black),
      this.isTitleCenter = false,
      this.leading,
      this.action});

  final String title;
  final TextStyle titleStyle;
  final bool isTitleCenter;
  final Widget? leading;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p8),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          XPaddingUtils.horizontalPadding(width: AppPadding.p10),
          Expanded(
            child: Text(
              title,
              style: titleStyle,
              textAlign: isTitleCenter ? TextAlign.center : TextAlign.start,
            ),
          ),
          XPaddingUtils.horizontalPadding(width: AppPadding.p10),
          if (action != null) action!,
        ],
      ),
    );
  }
}
