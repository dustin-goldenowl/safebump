import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/string_utils.dart';

class XTextFieldWithLabel extends StatelessWidget {
  const XTextFieldWithLabel({
    super.key,
    this.label,
    this.labelStyle = const TextStyle(
        fontSize: AppFontSize.f16, fontFamily: FontFamily.productSans),
    required this.hintText,
    this.hintStyle = const TextStyle(
        fontSize: AppFontSize.f14,
        fontFamily: FontFamily.inter,
        color: AppColors.hintTextColor),
    this.errorText,
    this.isObscureText = false,
    this.errorStyle,
    this.prefix,
    this.suffix,
    this.radius = AppRadius.r10,
    this.borderColor = AppColors.hintTextColor,
    required this.onChanged,
    this.keyboardType,
    this.maxLines = 1,
  });
  final String? label;
  final TextStyle? labelStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final Widget? prefix;
  final Widget? suffix;
  final double radius;
  final Color borderColor;
  final bool isObscureText;
  final TextInputType? keyboardType;
  final void Function(String) onChanged;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StringUtils.isNullOrEmpty(label)
            ? const SizedBox.shrink()
            : Text(label!, style: labelStyle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: TextField(
            maxLines: maxLines,
            keyboardType: keyboardType,
            textInputAction: TextInputAction.next,
            onChanged: (value) => onChanged(value),
            obscureText: isObscureText,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 0.5),
                  borderRadius: BorderRadius.circular(radius),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: AppColors.primary, width: 0.5),
                  borderRadius: BorderRadius.circular(radius),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: borderColor, width: 0.5),
                  borderRadius: BorderRadius.circular(radius),
                ),
                prefixIcon: prefix,
                suffixIcon: suffix,
                hintText: hintText,
                hintStyle: hintStyle,
                errorText: errorText,
                focusColor: AppColors.primary,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p10)),
          ),
        )
      ],
    );
  }
}
