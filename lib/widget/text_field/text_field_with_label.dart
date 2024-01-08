import 'package:flutter/material.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';

class XTextFieldWithLabel extends StatelessWidget {
  const XTextFieldWithLabel(
      {super.key,
      required this.label,
      this.labelStyle = const TextStyle(
          fontSize: AppFontSize.f16, fontWeight: FontWeight.bold),
      required this.hintText,
      this.hintStyle = const TextStyle(
          fontSize: AppFontSize.f14,
          fontStyle: FontStyle.italic,
          color: AppColors.hintTextColor),
      this.errorText,
      this.errorStyle,
      this.prefix,
      this.suffix,
      this.radius = AppRadius.r10,
      this.borderColor = AppColors.hintTextColor});
  final String label;
  final TextStyle? labelStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final String? errorText;
  final TextStyle? errorStyle;
  final Icon? prefix;
  final Icon? suffix;
  final double radius;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(radius),
                    borderSide: BorderSide(color: borderColor, width: 2)),
                prefixIcon: prefix,
                suffixIcon: suffix,
                hintText: hintText,
                hintStyle: hintStyle,
                errorText: errorText,
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p20, vertical: AppPadding.p10)),
          ),
        )
      ],
    );
  }
}
