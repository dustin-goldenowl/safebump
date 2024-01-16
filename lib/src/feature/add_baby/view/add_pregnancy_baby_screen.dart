import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/bottom_buttons.dart';
import 'package:safebump/widget/button/button_with_label.dart';
import 'package:safebump/widget/button/circle_button.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class AddPreggyScreen extends StatelessWidget {
  const AddPreggyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyBoard(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                XPaddingUtils.verticalPadding(height: AppPadding.p59),
                _renderTitle(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p45),
                _renderAddImage(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderNameField(context),
                XPaddingUtils.verticalPadding(height: AppPadding.p20),
                _renderDueDate(context),
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
          S.of(context).happyPreggy,
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

  Widget _renderDueDate(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: XLabelButton(
        onTapped: () async {
          await showBoardDateTimePicker(
            context: context,
            pickerType: DateTimePickerType.date,
            minimumDate: DateTime.now().subtract(const Duration(days: 280)),
            maximumDate: DateTime.now().add(const Duration(days: 280)),
            options: BoardDateTimeOptions(
              boardTitle: S.of(context).selectDate,
              activeColor: AppColors.primary,
              showDateButton: false,
            ),
          );
        },
        hint: S.of(context).dueDate,
        labelStyle: const TextStyle(
            fontSize: AppFontSize.f16,
            fontFamily: FontFamily.productSans,
            color: AppColors.grey2),
        hintStyle: const TextStyle(
            fontSize: AppFontSize.f14,
            fontFamily: FontFamily.inter,
            color: AppColors.grey4),
        label: S.of(context).addDueDate,
        icon: Icons.calendar_today_outlined,
      ),
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
          AppCoordinator.pop();
        });
  }
}
