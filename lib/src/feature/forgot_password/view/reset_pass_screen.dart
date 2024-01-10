import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/fill_button.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => AppCoordinator.pop(),
        ),
      ),
      backgroundColor: AppColors.white4,
      body: DismissKeyBoard(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Column(
            children: [
              XPaddingUtils.verticalPadding(height: AppPadding.p10),
              _renderLogoApp(),
              _renderTitle(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p20),
              _renderSubTitle(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p10),
              _renderPasswordField(context),
              _renderConfirmPasswordField(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p30),
              _renderVerifyButton(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
            ],
          ),
        )),
      ),
    );
  }

  Widget _renderLogoApp() {
    return Assets.images.images.logo.image(width: AppSize.s200);
  }

  Widget _renderTitle(BuildContext context) {
    return Text(
      S.of(context).resetPassword,
      style: const TextStyle(
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f30,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _renderSubTitle(BuildContext context) {
    return Text(
      S.of(context).yourNewPasswordMustBe,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.grey2,
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f16),
    );
  }

  Widget _renderPasswordField(BuildContext context) {
    return XTextFieldWithLabel(
        onChanged: (pass) {},
        hintText: S.of(context).enterHere,
        isObscureText: true,
        prefix: const Icon(
          Icons.lock,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ),
        suffix: IconButton(
          icon: const Icon(
            Icons.visibility,
            size: AppSize.s14,
            color: AppColors.hintTextColor,
          ),
          onPressed: () {},
        ));
  }

  Widget _renderConfirmPasswordField(BuildContext context) {
    return XTextFieldWithLabel(
        onChanged: (pass) {},
        hintText: S.of(context).enterHere,
        isObscureText: true,
        prefix: const Icon(
          Icons.lock,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ),
        suffix: IconButton(
          icon: const Icon(
            Icons.visibility,
            size: AppSize.s14,
            color: AppColors.hintTextColor,
          ),
          onPressed: () {},
        ));
  }

  Widget _renderVerifyButton(BuildContext context) {
    return XFillButton(
        onPressed: () {},
        borderRadius: AppRadius.r10,
        label: Text(
          S.of(context).resetPassword,
          style: const TextStyle(
              fontSize: AppFontSize.f16,
              color: AppColors.white,
              fontFamily: FontFamily.productSans),
        ));
  }
}
