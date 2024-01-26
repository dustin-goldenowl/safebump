import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({Key? key}) : super(key: key);

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen>
    with TickerProviderStateMixin {
  AnimationController? controller;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.black,
              size: AppSize.s20,
            ),
            onPressed: () {
              AppCoordinator.pop();
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(AppSize.s4),
                topRight: Radius.circular(AppSize.s4),
              ),
            ),
            child: Column(
              children: [
                _renderHeader(context),
                _renderBlueLine(),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(AppPadding.p16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).whatMedicationWillYouTake,
                          textScaler: TextScaler.noScaling,
                          style: const TextStyle(
                              fontFamily: FontFamily.abel,
                              color: AppColors.black),
                        ),
                        _renderSearchInput(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _renderHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p12,
      ),
      child: Text(
        S.of(context).addAMedication,
        textScaler: TextScaler.noScaling,
        style: const TextStyle(
            fontFamily: FontFamily.inter,
            fontWeight: FontWeight.bold,
            fontSize: AppFontSize.f24,
            color: AppColors.black),
      ),
    );
  }

  Container _renderBlueLine() {
    return Container(
      margin: const EdgeInsets.only(top: AppMargin.m8),
      height: AppSize.s6,
      color: AppColors.green,
    );
  }

  Container _renderSearchInput() {
    return Container(
        margin: const EdgeInsets.only(
          top: AppMargin.m24,
          bottom: AppMargin.m8,
        ),
        child: XTextFieldWithLabel(
          hintText: S.of(context).enterMedicationName,
          onChanged: (text) {
            //TODO: enter name
          },
          prefix: const Icon(
            Icons.medication_outlined,
            color: AppColors.hintTextColor,
            size: AppSize.s20,
          ),
          suffix: IconButton(
            icon: const Icon(
              Icons.rocket_launch,
              color: AppColors.hintTextColor,
              size: AppSize.s20,
            ),
            onPressed: () {
              // TODO: Show bottom sheet
            },
          ),
        ));
  }
}
