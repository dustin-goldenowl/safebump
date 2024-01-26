import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/widget/button/fill_button.dart';
import 'package:safebump/widget/separator/solid_separator.dart';

class XListViewBottomSheet extends StatefulWidget {
  final String? title;
  final String? buttonName;
  final double? heightFactor;
  final String selectedValue;
  final List<String> data;
  final void Function(String value) onPressDone;
  final bool isShowButton;

  const XListViewBottomSheet({
    Key? key,
    this.title,
    this.buttonName,
    this.heightFactor,
    required this.selectedValue,
    required this.data,
    required this.onPressDone,
    this.isShowButton = true,
  }) : super(key: key);

  @override
  State<XListViewBottomSheet> createState() => _XListViewBottomSheetState();
}

class _XListViewBottomSheetState extends State<XListViewBottomSheet> {
  String _currentValue = "";

  @override
  void initState() {
    super.initState();
    _currentValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(
            top: AppMargin.m20,
            bottom: AppMargin.m20,
          ),
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.title != null)
                Container(
                  margin: const EdgeInsets.only(bottom: AppMargin.m16),
                  child: Text(
                    widget.title!,
                    textScaler: TextScaler.noScaling,
                    style: const TextStyle(
                        fontFamily: FontFamily.inter,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey,
                        fontSize: AppFontSize.f16),
                  ),
                ),
              ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height *
                        (widget.heightFactor ?? 0.65)),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      _renderCell(widget.data[index]),
                  itemCount: widget.data.length,
                  separatorBuilder: (context, index) {
                    return const XSolidSeparator(
                      color: AppColors.grey4,
                    );
                  },
                ),
              ),
              if (widget.isShowButton)
                Container(
                  margin: const EdgeInsets.only(
                    top: AppMargin.m16,
                  ),
                  width: double.infinity,
                  child: XFillButton(
                    label: Text(
                      widget.buttonName ?? S.of(context).select,
                      textScaler: TextScaler.noScaling,
                      style: const TextStyle(
                          fontFamily: FontFamily.productSans,
                          fontSize: AppFontSize.f16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.white),
                    ),
                    onPressed: () {
                      widget.onPressDone(_currentValue);
                      AppCoordinator.pop();
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderCell(String value) {
    return ListTile(
      title: Text(
        value,
        textScaler: TextScaler.noScaling,
        style: _currentValue == value
            ? const TextStyle(
                fontFamily: FontFamily.abel,
                fontSize: AppFontSize.f16,
                fontWeight: FontWeight.bold,
                color: AppColors.black)
            : const TextStyle(
                fontFamily: FontFamily.abel,
                fontSize: AppFontSize.f16,
                color: AppColors.black),
      ),
      trailing: _currentValue == value
          ? const Icon(Icons.check, color: AppColors.green)
          : null,
      onTap: () {
        if (widget.isShowButton) {
          setState(() {
            _currentValue = value;
          });
        } else {
          widget.onPressDone(value);
          AppCoordinator.pop();
        }
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p15),
    );
  }
}
