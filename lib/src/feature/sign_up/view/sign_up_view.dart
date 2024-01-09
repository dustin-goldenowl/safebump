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
import 'package:safebump/widget/button/text_button.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white4,
      body: DismissKeyBoard(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Column(
            children: [
              XPaddingUtils.verticalPadding(height: AppPadding.p53),
              _renderLogoApp(),
              _renderSignUpSection(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
              _renderSignInSection(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p23),
                child: Text(
                  S.of(context).or.toUpperCase(),
                  style: const TextStyle(fontFamily: FontFamily.inter),
                ),
              ),
              _renderSocialSignInSection(context),
            ],
          ),
        )),
      ),
    );
  }

  Widget _renderLogoApp() {
    return Assets.images.images.logo.image(width: AppSize.s200);
  }

  Widget _renderSignUpSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _renderNameField(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p10),
        _renderEmailField(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p10),
        _renderPasswordField(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p30),
        _renderSignUpButton(context),
      ],
    );
  }

  Widget _renderNameField(BuildContext context) {
    return XTextFieldWithLabel(
        onChanged: (name) {},
        label: S.of(context).enterYourName,
        hintText: S.of(context).enterHere,
        suffix: const Icon(
          Icons.person_outline,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ));
  }

  Widget _renderEmailField(BuildContext context) {
    return XTextFieldWithLabel(
        onChanged: (email) {},
        label: S.of(context).enterYourEmail,
        hintText: S.of(context).pk3076889,
        suffix: const Icon(
          Icons.mail_outline,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ));
  }

  Widget _renderPasswordField(BuildContext context) {
    return XTextFieldWithLabel(
        onChanged: (pass) {},
        label: S.of(context).createYourPassword,
        hintText: S.of(context).enterHere,
        isObscureText: true,
        suffix: IconButton(
          icon: const Icon(
            Icons.visibility,
            size: AppSize.s14,
            color: AppColors.hintTextColor,
          ),
          onPressed: () {},
        ));
  }

  Widget _renderSignUpButton(BuildContext context) {
    return XFillButton(
        onPressed: () {},
        borderRadius: AppRadius.r10,
        label: Text(
          S.of(context).signUp,
          style: const TextStyle(
              color: AppColors.white, fontFamily: FontFamily.productSans),
        ));
  }

  Widget _renderSignInSection(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).alreadyHaveAccount,
          style: const TextStyle(fontFamily: FontFamily.inter),
        ),
        XTextButton(
          callback: () => AppCoordinator.showSignInScreen(),
          label: S.of(context).login,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        )
      ],
    );
  }

  Widget _renderSocialSignInSection(BuildContext context) {
    return Column(
      children: [
        _renderGGSignUp(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
      ],
    );
  }

  Widget _renderGGSignUp(BuildContext context) {
    return XFillButton(
        bgColor: AppColors.white,
        border: const BorderSide(color: AppColors.grey2, width: 0.5),
        borderRadius: AppRadius.r10,
        onPressed: () {},
        label: Row(
          children: [
            Assets.images.images.ggLogo.image(),
            XPaddingUtils.horizontalPadding(width: AppPadding.p15),
            Text(
              S.of(context).signUpWithGG,
              style: const TextStyle(
                  fontSize: AppFontSize.f16,
                  fontFamily: FontFamily.productSans,
                  color: AppColors.black),
            )
          ],
        ));
  }
}
