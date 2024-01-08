import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/button/fill_button.dart';
import 'package:safebump/widget/button/text_button.dart';
import 'package:safebump/widget/text_field/text_field_with_label.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyBoard(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p30),
          child: Column(
            children: [
              XPaddingUtils.verticalPadding(height: AppPadding.p53),
              _renderLogoApp(),
              _renderSignInSection(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
              _renderSignUpSection(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppPadding.p23),
                child: Text(S.of(context).or.toUpperCase()),
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

  Widget _renderSignInSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _renderEmailField(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p10),
        _renderPasswordField(context),
        _renderForgotPasswordButton(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p30),
        _renderLoginButton(context),
      ],
    );
  }

  Widget _renderEmailField(BuildContext context) {
    return XTextFieldWithLabel(
        label: S.of(context).email,
        hintText: S.of(context).enterHere,
        suffix: const Icon(
          Icons.mail_outline,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ));
  }

  Widget _renderPasswordField(BuildContext context) {
    return XTextFieldWithLabel(
        label: S.of(context).password,
        hintText: S.of(context).enterHere,
        suffix: const Icon(
          Icons.remove_red_eye,
          size: AppSize.s14,
          color: AppColors.hintTextColor,
        ));
  }

  Widget _renderForgotPasswordButton(BuildContext context) {
    return XTextButton(
      label: S.of(context).forgotPassword,
      callback: () {},
    );
  }

  Widget _renderLoginButton(BuildContext context) {
    return XFillButton(
        borderRadius: AppRadius.r10,
        label: Text(
          S.of(context).login,
          style: const TextStyle(color: AppColors.white),
        ));
  }

  Widget _renderSignUpSection(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).dontHaveAccount),
        XTextButton(
          callback: () {},
          label: S.of(context).signUp,
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
        _renderAppleSignUp(context),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
      ],
    );
  }

  Widget _renderGGSignUp(BuildContext context) {
    return XFillButton(
        bgColor: AppColors.white,
        onPressed: () {},
        label: Row(
          children: [
            Assets.images.images.ggLogo.image(),
            XPaddingUtils.horizontalPadding(width: AppPadding.p10),
            Text(
              S.of(context).signUpWithGG,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f16,
                  color: AppColors.black),
            )
          ],
        ));
  }

  Widget _renderAppleSignUp(BuildContext context) {
    return XFillButton(
        bgColor: AppColors.white,
        onPressed: () {},
        label: Row(
          children: [
            Assets.images.images.appleLogo.image(),
            XPaddingUtils.horizontalPadding(width: AppPadding.p10),
            Text(
              S.of(context).signUpWithApple,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f16,
                  color: AppColors.black),
            )
          ],
        ));
  }
}
