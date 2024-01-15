import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/bottom_buttons.dart';
import 'package:safebump/widget/button/button_with_label.dart';
import 'package:safebump/widget/button/circle_button.dart';
import 'package:safebump/widget/button/dropdown_button.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class AddBabyScreen extends StatelessWidget {
  const AddBabyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyBoard(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XPaddingUtils.verticalPadding(height: AppPadding.p59),
                _renderTitle(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p45),
                _renderAddImage(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderNameField(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderGender(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderBirthDateTime(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderBabyBody(context),
                _renderBottomButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderTitle(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          S.of(context).happParenting,
          style: const TextStyle(
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.w700,
              fontSize: AppFontSize.f30),
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p10),
        Text(
          S.of(context).tellMeMoreAbout,
          style: const TextStyle(
              fontFamily: FontFamily.inter, fontSize: AppFontSize.f16),
        )
      ],
    );
  }

  Widget _renderAddImage(BuildContext context) {
    return XCircleButton(
        buttonLabelBottom: S.of(context).babysPicture,
        onTapped: () {
          // TODO: add event
        });
  }

  Widget _renderNameField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: XTextFieldWithLabel(
          labelStyle: const TextStyle(
              fontSize: AppFontSize.f16,
              fontFamily: FontFamily.productSans,
              color: AppColors.grey2),
          hintStyle: const TextStyle(
              fontSize: AppFontSize.f14,
              fontFamily: FontFamily.inter,
              color: AppColors.grey4),
          hintText: S.of(context).babysName,
          label: S.of(context).name,
          onChanged: (tetx) {
            // TODO: on changed
          }),
    );
  }

  Widget _renderGender(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: XDropdownButton(
            labelStyle: const TextStyle(
                fontSize: AppFontSize.f16,
                fontFamily: FontFamily.productSans,
                color: AppColors.grey2),
            label: S.of(context).gender,
            items: const [DropdownMenuItem(child: Text('Gender'))],
            onChanged: (value) {}));
  }

  Widget _renderBirthDateTime(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _renderBirthDate(context),
            XPaddingUtils.horizontalPadding(width: AppPadding.p10),
            _renderBirthTime(context),
          ],
        ));
  }

  Widget _renderBottomButton(BuildContext context) {
    return XBottomButtons(
        positiveButtonText: S.of(context).save,
        cancelButtonText: S.of(context).cancel,
        onTappedPositive: () {
          //TODO: Ontap Save
        },
        onTappedCancel: () {
          // TODO: On tap cancel
        });
  }

  Widget _renderBirthDate(BuildContext context) {
    return Expanded(
        child: XLabelButton(
      onTapped: () {
        // TODO: change date
      },
      hint: S.of(context).selectDate,
      label: S.of(context).dateOfBirth,
      icon: Icons.calendar_today_outlined,
      labelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontFamily: FontFamily.productSans,
          color: AppColors.grey2),
    ));
  }

  Widget _renderBirthTime(BuildContext context) {
    return Expanded(
        child: XLabelButton(
      onTapped: () {
        // TODO: change date
      },
      hint: S.of(context).selectTime,
      label: S.of(context).timeOfBirth,
      icon: Icons.access_time,
      labelStyle: const TextStyle(
          fontSize: AppFontSize.f16,
          fontFamily: FontFamily.productSans,
          color: AppColors.grey2),
    ));
  }

  Widget _renderBabyBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            _renderBabyWeight(context),
            XPaddingUtils.horizontalPadding(width: AppPadding.p10),
            _renderBabyHeight(context),
          ],
        ));
  }

  Widget _renderBabyWeight(BuildContext context) {
    return Expanded(
      child: XTextFieldWithLabel(
        label: S.of(context).birthWeight,
        labelStyle: const TextStyle(
            fontSize: AppFontSize.f16,
            fontFamily: FontFamily.productSans,
            color: AppColors.grey2),
        hintText: S.of(context).birthWeight,
        hintStyle: const TextStyle(
            fontSize: AppFontSize.f14,
            fontFamily: FontFamily.inter,
            color: AppColors.grey4),
        suffix: _renderUnit(S.of(context).kg),
        onChanged: (value) {},
      ),
    );
  }

  Widget _renderBabyHeight(BuildContext context) {
    return Expanded(
      child: XTextFieldWithLabel(
        keyboardType: TextInputType.number,
        label: S.of(context).birthHeight,
        labelStyle: const TextStyle(
            fontSize: AppFontSize.f16,
            fontFamily: FontFamily.productSans,
            color: AppColors.grey2),
        hintText: S.of(context).birthHeight,
        hintStyle: const TextStyle(
            fontSize: AppFontSize.f14,
            fontFamily: FontFamily.inter,
            color: AppColors.grey4),
        suffix: _renderUnit(S.of(context).cm),
        onChanged: (value) {},
      ),
    );
  }

  Widget _renderUnit(String unit) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          unit,
          style: const TextStyle(
              fontFamily: FontFamily.inter, fontSize: AppFontSize.f16),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
