import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/fill_button.dart';

class SetupMedicationScreen extends StatelessWidget {
  const SetupMedicationScreen({Key? key, required this.setupMedication})
      : super(key: key);
  final Function(bool) setupMedication;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _renderCardContent(context),
      ],
    );
  }

  Widget _renderCardContent(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _renderMedicationsImage(context),
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
          Text(
            S.of(context).setupMedication,
            textScaler: TextScaler.noScaling,
            style: const TextStyle(
                fontFamily: FontFamily.inter,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.f24,
                color: AppColors.black),
          ),
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
          _renderSetupButton(context),
        ],
      ),
    );
  }

  Container _renderMedicationsImage(context) {
    return Container(
      height: 175,
      width: 327,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Assets.images.images.medicine.provider(),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _renderSetupButton(context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: XFillButton(
        label: Text(
          S.of(context).setupNow,
          textScaler: TextScaler.noScaling,
          style: const TextStyle(
              fontFamily: FontFamily.productSans,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.f16,
              color: AppColors.white),
        ),
        onPressed: () async {
          await AppCoordinator.showAddMedication().then((value) {
            setupMedication(value);
          });
        },
      ),
    );
  }
}
