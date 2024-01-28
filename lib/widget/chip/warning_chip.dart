import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/utils.dart';

class XWarningChip extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final Color? bgColor;
  final Color? textColor;
  final double? borderRadius;
  final double? iconSize;
  final bool hasIcon;
  final Function(String)? removeRemindTime;
  const XWarningChip({
    Key? key,
    this.icon,
    this.iconColor,
    required this.title,
    this.bgColor,
    this.textColor,
    this.borderRadius = AppRadius.r16,
    this.iconSize,
    this.hasIcon = true,
    this.removeRemindTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p6, vertical: AppPadding.p5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        color: bgColor ?? AppColors.yellow,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasIcon)
            Icon(
              icon ?? Icons.warning,
              color: iconColor,
              size: iconSize ?? AppSize.s20,
            ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: AppMargin.m4),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: FontFamily.abel,
                  color: textColor ?? AppColors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f14,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (!isNullOrEmpty(removeRemindTime))
            IconButton(
                onPressed: () => removeRemindTime!(title),
                style: ButtonStyle(
                  padding:
                      MaterialStateProperty.all(EdgeInsetsDirectional.zero),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.red,
                  size: AppSize.s16,
                ))
        ],
      ),
    );
  }
}
