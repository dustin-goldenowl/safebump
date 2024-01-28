import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';

class XPickableTextField extends StatelessWidget {
  final String? label;
  final bool isBoldLabel;
  final double? labelFontSize;
  final bool isRequired;
  final String hint;
  final String? textValue;
  final String? errorText;
  final bool isEditable;
  final TextInputAction textInputAction;
  final Widget? trailingIcon;
  final Function(String)? onTextChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onPressTextField;
  final TextEditingController? controller;
  final bool isDisable;

  const XPickableTextField({
    Key? key,
    this.label,
    this.isBoldLabel = true,
    required this.hint,
    this.textValue,
    this.errorText,
    required this.isEditable,
    this.labelFontSize = AppSize.s14,
    this.textInputAction = TextInputAction.next,
    this.trailingIcon,
    this.onTextChanged,
    this.onPressTextField,
    this.onSubmitted,
    this.controller,
    this.isDisable = false,
    this.isRequired = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null && label!.isNotEmpty
            ? Container(
                margin: const EdgeInsets.only(
                  bottom: AppSize.s8,
                ),
                child: RichText(
                  textScaler: TextScaler.noScaling,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: label,
                    style: isBoldLabel
                        ? TextStyle(
                            fontFamily: FontFamily.abel,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: labelFontSize!,
                          )
                        : TextStyle(
                            fontFamily: FontFamily.abel,
                            color: AppColors.black,
                            fontSize: labelFontSize!,
                          ),
                    children: isRequired
                        ? [
                            const TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: AppColors.red,
                                fontSize: AppFontSize.f14,
                              ),
                            ),
                          ]
                        : [],
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Column(
          children: [
            GestureDetector(
              
              onTap: isDisable
                  ? null
                  : !isEditable
                      ? onPressTextField
                      : null,
              child: _TextFormField(
                hint: hint,
                errorText: errorText,
                textValue: textValue,
                isEditable: isEditable,
                textInputAction: textInputAction,
                trailingIcon: trailingIcon,
                onTextChanged: onTextChanged,
                onFieldSubmitted: onSubmitted,
                controller: controller,
                isDisable: isDisable,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TextFormField extends StatelessWidget {
  final String hint;
  final String? errorText;
  final String? textValue;
  final bool isEditable;
  final TextInputAction textInputAction;
  final Widget? trailingIcon;
  final Function(String)? onTextChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextEditingController? controller;
  final bool isDisable;
  const _TextFormField({
    Key? key,
    required this.hint,
    required this.errorText,
    required this.textValue,
    required this.isEditable,
    required this.trailingIcon,
    required this.textInputAction,
    required this.onTextChanged,
    required this.isDisable,
    this.onFieldSubmitted,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: textValue,
      style: TextStyle(
        fontFamily: FontFamily.abel,
        color: isDisable ? AppColors.grey3 : AppColors.grey,
        fontSize: AppFontSize.f16,
      ),
      decoration: InputDecoration(
        filled: true,
        hintText: hint,
        errorText: null,
        errorStyle: errorText != null && errorText!.isNotEmpty == true
            ? Theme.of(context).inputDecorationTheme.errorStyle
            : const TextStyle(height: 0),
        suffixIconConstraints: const BoxConstraints(
          minWidth: AppSize.s20,
        ),
        // isCollapsed: true,
        isDense: true,
        suffixIcon: trailingIcon ?? const SizedBox.shrink(),
        fillColor: AppColors.grey6,
        border: _renderCustomBorder(),
        focusedBorder: _renderCustomBorder(),
        enabledBorder: _renderCustomBorder(),
        disabledBorder: _renderCustomBorder(),
      ),
      textInputAction: textInputAction,
      onChanged: onTextChanged,
      enabled: isEditable,
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  OutlineInputBorder _renderCustomBorder() {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(
          AppRadius.r10,
        ),
      ),
      borderSide: errorText != null && errorText!.isNotEmpty == true
          ? const BorderSide(color: AppColors.red)
          : BorderSide.none,
    );
  }
}
