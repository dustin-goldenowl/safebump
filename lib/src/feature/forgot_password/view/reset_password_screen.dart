import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/package/dismiss_keyboard/dismiss_keyboard.dart';
import 'package:safebump/src/feature/forgot_password/logic/cubit/reset_password_bloc.dart';
import 'package:safebump/src/feature/forgot_password/logic/state/reset_password_state.dart';
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
              XPaddingUtils.verticalPadding(height: AppPadding.p30),
              _renderBack2LogInButton(context),
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
      S.of(context).resetPassword,
      style: const TextStyle(
          fontFamily: FontFamily.productSans,
          fontSize: AppFontSize.f30,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _renderSubTitle(BuildContext context) {
    return BlocSelector<ResetPasswordBloc, ResetPasswordState, String>(
        selector: (state) => state.email,
        builder: (context, mail) {
          return Column(
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    S.of(context).weJustSentYou,
                    style: const TextStyle(
                        color: AppColors.grey2,
                        fontFamily: FontFamily.productSans,
                        fontSize: AppFontSize.f16),
                  ),
                  Text(
                    mail,
                    style: const TextStyle(
                        color: AppColors.primary,
                        fontFamily: FontFamily.productSans,
                        fontWeight: FontWeight.bold,
                        fontSize: AppFontSize.f16),
                  )
                ],
              ),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
              Text(
                S.of(context).pleseCheckYourMail,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppColors.grey2,
                    fontFamily: FontFamily.productSans,
                    fontSize: AppFontSize.f16),
              )
            ],
          );
        });
  }

  Widget _renderBack2LogInButton(BuildContext context) {
    return XFillButton(
        onPressed: () =>
            context.read<ResetPasswordBloc>().onTapBack2LogInButton(),
        borderRadius: AppRadius.r10,
        label: Text(
          S.of(context).login,
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
          S.of(context).didntGetTheMail,
          style: const TextStyle(fontFamily: FontFamily.inter),
        ),
        BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
          buildWhen: (previous, current) =>
              previous.isTimeOut != current.isTimeOut ||
              previous.timeCounter != current.timeCounter,
          builder: (context, state) {
            return XTextButton(
              callback: () =>
                  context.read<ResetPasswordBloc>().onTapResendButton(),
              label: state.isTimeOut
                  ? S.of(context).resend
                  : "${state.timeCounter}s",
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            );
          },
        )
      ],
    );
  }
}
