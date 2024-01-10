import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
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

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

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
              _renderOTPCodeField(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p30),
              _renderVerifyButton(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
              _renderResendCodeButton(context),
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
      S.of(context).vertifyCode,
      style: const TextStyle(
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f30,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _renderSubTitle(BuildContext context) {
    return Text(
      S.of(context).enterTheCode,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: AppColors.grey2,
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f16),
    );
  }

  Widget _renderOTPCodeField(BuildContext context) {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      otpFieldStyle: OtpFieldStyle(focusBorderColor: AppColors.primary),
      fieldWidth: AppSize.s40,
      style: const TextStyle(
          fontFamily: FontFamily.inter, fontSize: AppFontSize.f16),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.box,
      onCompleted: (pin) {},
    );
  }

  Widget _renderVerifyButton(BuildContext context) {
    return XFillButton(
        onPressed: () => AppCoordinator.showResetPasswordScreen(),
        borderRadius: AppRadius.r10,
        label: Text(
          S.of(context).verify,
          style: const TextStyle(
              fontSize: AppFontSize.f16,
              color: AppColors.white,
              fontFamily: FontFamily.productSans),
        ));
  }

  Widget _renderResendCodeButton(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).didntGetTheCode,
          style: const TextStyle(fontFamily: FontFamily.inter),
        ),
        XTextButton(
          callback: () => AppCoordinator.showSignUpScreen(),
          label: S.of(context).resend,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
        )
      ],
    );
  }
}
