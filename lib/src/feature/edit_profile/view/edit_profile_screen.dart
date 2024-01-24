import 'package:board_datetime_picker/board_datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/config/enum/baby_type_enum.dart';
import 'package:safebump/src/dialogs/alert_wrapper.dart';
import 'package:safebump/src/feature/edit_profile/logic/picker_image.dart';
import 'package:safebump/src/feature/edit_profile/widget/image_picker_bottom_sheet.dart';
import 'package:safebump/src/feature/edit_profile/widget/ruler_bottom_sheet.dart';
import 'package:safebump/src/feature/edit_profile/widget/unit_segment.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/src/utils/string_utils.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';
import 'package:safebump/widget/avatar/avatar.dart';
import 'package:safebump/widget/button/button_with_label.dart';
import 'package:safebump/widget/button/text_button.dart';
import 'package:safebump/widget/radio/radio_list_tile.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: DismissKeyBoard(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              _renderAppBar(),
              _renderSeparatorAndAvatar(),
              Expanded(
                child: _renderInforUser(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBarDashboard(
        title: S.of(context).editProfile,
        isTitleCenter: true,
        leading: IconButton(
            onPressed: () {
              if (true) {
                // If user has changed profile but they hasn't save
                XAlert.showConfirmDialog(S.of(context).unsavedChanges,
                        S.of(context).doYouWantToSave,
                        textNo: S.of(context).cancel,
                        textYes: S.of(context).saveChanges)
                    .then((value) {
                  if (value == true) {
                    //TODO: Add logic save changes
                  } else {
                    AppCoordinator.pop(false);
                  }
                });
              }
              // else {
              //   AppCoordinator.pop(false);
              // }
            },
            icon: const Icon(
              Icons.arrow_back,
              size: AppSize.s30,
            )),
        action: XTextButton(
          label: S.of(context).save,
          callback: () {
            // Add logic save changes
          },
        ));
  }

  Widget _renderSeparatorAndAvatar() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      child: Column(
        children: [
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
          XAvatar(
              key: UniqueKey(),
              isEditable: true,
              onEdit: () {
                pickImagehandler(context, '');
              }),
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
        ],
      ),
    );
  }

  void pickImagehandler(BuildContext context, String? avatar) {
    showCupertinoModalBottomSheet(
        duration: const Duration(milliseconds: 350),
        animationCurve: Curves.easeOut,
        barrierColor: AppColors.black.withOpacity(0.5),
        context: context,
        builder: (_) => XImagePickerBottomSheet(
            isPhotoExisted: !StringUtils.isNullOrEmpty(avatar),
            onSelectedValue: (value) async {
              AppCoordinator.pop();
              switch (value as String) {
                case 'Take photo':
                  try {
                    final image = await PickerImageApp.show(ImageSource.camera);
                    if (image != null) {
                      // TODO: Save image
                    }
                  } catch (error) {
                    xLog.e("pickImagehandler $error");
                  }
                  break;
                case 'Choose photo':
                  try {
                    final image =
                        await PickerImageApp.show(ImageSource.gallery);
                    if (image != null) {
                      // TODO: Save image
                    }
                  } catch (error) {
                    xLog.e("pickImagehandler $error");
                  }
                  break;
                case 'Remove photo':
                  try {
                    // TODO: Remove photo
                  } catch (error) {
                    xLog.e("pickImagehandler $error");
                  }
                  break;
              }
            }));
  }

  Widget _renderInforUser() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppMargin.m16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            XPaddingUtils.verticalPadding(height: AppPadding.p23),
            _renderName(context),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
            _renderEmail(context),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
            _renderDateOfBirth(context),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
            _renderGender(),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
            _renderHeightAndWeight(context),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
          ],
        ),
      ),
    );
  }

  Widget _renderName(BuildContext context) {
    return XTextFieldWithLabel(
      label: S.of(context).name,
      hintText: S.of(context).enterYourName,
      onChanged: (name) {
        // TODO: Change name
      },
    );
  }

  Widget _renderEmail(BuildContext context) {
    return XTextFieldWithLabel(
      label: S.of(context).email,
      hintText: S.of(context).enterYourEmail,
      onChanged: (mail) {
        // TODO: Change mail
      },
    );
  }

  Widget _renderDateOfBirth(BuildContext context) {
    return XLabelButton(
      onTapped: () async {
        await showBoardDateTimePicker(
          context: context,
          pickerType: DateTimePickerType.date,
          options: BoardDateTimeOptions(
            boardTitle: S.of(context).selectDate,
            activeColor: AppColors.primary,
          ),
          onChanged: (date) {
            // TODO: change birthday
          },
        );
      },
      hint: S.of(context).selectDate,
      label: S.of(context).dateOfBirth,
      icon: Icons.calendar_today_outlined,
      labelStyle: const TextStyle(
        fontSize: AppFontSize.f16,
        fontFamily: FontFamily.productSans,
      ),
    );
  }

  Widget _renderGender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).gender,
            style: const TextStyle(
                fontSize: AppFontSize.f16, fontFamily: FontFamily.productSans)),
        XPaddingUtils.verticalPadding(height: AppPadding.p8),
        Container(
            decoration: BoxDecoration(
              color: AppColors.grey6,
              borderRadius: BorderRadius.circular(AppRadius.r10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: XRadioListTile<Gender>(
                    value: Gender.female,
                    groupValue: Gender.female,
                    label: S.of(context).female,
                    onChanged: (value) {
                      // TODO: onchange gender
                    },
                  ),
                ),
                Container(
                  width: AppSize.s1,
                  height: AppSize.s20,
                  color: AppColors.grey2,
                ),
                Expanded(
                  child: XRadioListTile<Gender>(
                    value: Gender.male,
                    groupValue: Gender.female,
                    label: S.of(context).male,
                    onChanged: (value) {
                      // TODO: onchange gender
                    },
                  ),
                ),
              ],
            )),
      ],
    );
  }

  Widget _renderHeightAndWeight(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(S.of(context).bodyMeasurement,
            style: const TextStyle(
                fontSize: AppFontSize.f16, fontFamily: FontFamily.productSans)),
        XPaddingUtils.verticalPadding(height: AppPadding.p8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey5,
              width: AppSize.s1,
            ),
            borderRadius: BorderRadius.circular(
              AppRadius.r10,
            ),
          ),
          child: _renderSegmentControl(),
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        Column(
          children: [
            _renderHeight(context),
            XPaddingUtils.verticalPadding(height: AppPadding.p16),
            _renderWeight(context),
          ],
        ),
      ],
    );
  }

  Widget _renderSegmentControl() {
    return XUnitsSegment(
      unitType: MeasurementUnitType.metric,
      onTap: (MeasurementUnitType? value) {
        // TODO: Change measurement
      },
    );
  }

  String _markerText(
      double currentValue, RulerType rulerType, MeasurementUnitType unitType) {
    switch (rulerType) {
      case RulerType.height:
        switch (unitType) {
          case MeasurementUnitType.imperial:
            return "${(currentValue ~/ 100).toString()} ft, ${(currentValue % 100).round().toString()} in";
          case MeasurementUnitType.metric:
            return "${currentValue.round()} cm";
        }
      case RulerType.weight:
        switch (unitType) {
          case MeasurementUnitType.imperial:
            return "${(currentValue)} lb";
          case MeasurementUnitType.metric:
            return "$currentValue kg";
        }
    }
  }

  Widget _renderHeight(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onTapHeightAndWeight(context, RulerType.height);
        },
        child: _renderTextFieldHeightWeight(
          _markerText(50, RulerType.height, MeasurementUnitType.metric),
          S.of(context).height,
        ));
  }

  Widget _renderWeight(BuildContext context) {
    return GestureDetector(
        onTap: () {
          _onTapHeightAndWeight(context, RulerType.weight);
        },
        child: _renderTextFieldHeightWeight(
          _markerText(50, RulerType.weight, MeasurementUnitType.metric),
          S.of(context).weight,
        ));
  }

  void _onTapHeightAndWeight(BuildContext context, RulerType rulerType) {
    showCupertinoModalBottomSheet(
      duration: const Duration(milliseconds: 300),
      animationCurve: Curves.easeOut,
      context: context,
      builder: (context) => XRulerBottomSheet(
        value: 100,
        rulerType: rulerType,
        measurementUnitType: MeasurementUnitType.metric,
      ),
      barrierColor: Colors.transparent.withOpacity(0.5),
      enableDrag: false,
    ).then((valueCallback) {
      if (valueCallback != null) {
        if (rulerType == RulerType.weight) {
          // TODO: update to field weight infor
        } else {
          // TODO: update to field height infor
        }
      }
    });
  }

  Widget _renderTextFieldHeightWeight(String value, String title) {
    return TextFormField(
      style: const TextStyle(
        fontFamily: FontFamily.inter,
        color: AppColors.grey,
        fontSize: AppFontSize.f16,
      ),
      decoration: InputDecoration(
        suffixIconConstraints: const BoxConstraints(
          maxWidth: AppSize.s150,
        ),
        suffixIcon: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(value),
            const IconButton(
              constraints: BoxConstraints(maxWidth: AppSize.s36),
              padding: EdgeInsets.fromLTRB(
                AppPadding.p10,
                AppPadding.p8,
                AppPadding.p12,
                AppPadding.p8,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              onPressed: null,
              splashColor: Colors.transparent,
            ),
          ],
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: AppSize.s36,
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.only(left: AppPadding.p12),
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: FontFamily.inter,
              color: AppColors.grey3,
              fontSize: AppFontSize.f16,
            ),
          ),
        ),
        enabled: false,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppRadius.r10,
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
