import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/feature/forgot_password/logic/state/enter_mail_state.dart';
import 'package:safebump/src/feature/sign_in/validated/validator.dart';
import 'package:safebump/src/network/data/sign/sign_repository.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/utils/string_utils.dart';
import 'package:safebump/src/utils/utils.dart';

class EnterMailBloc extends Cubit<EnterMailState> {
  EnterMailBloc() : super(EnterMailState());

  void onEmailChanged(String email) {
    emit(state.copyWith(mailValidated: '', mail: email));
  }

  bool _isEmailValidated(BuildContext context) {
    final errorText = Validator.emailValidated(state.mail, context);
    emit(state.copyWith(mailValidated: errorText));
    return StringUtils.isNullOrEmpty(errorText);
  }

  void onTapSendEmail(BuildContext context) {
    if (state.status == EnterMailStatus.onProcess) return;
    if (!_isEmailValidated(context)) {
      emit(state.copyWith(status: EnterMailStatus.fail));
      return;
    }
    emit(state.copyWith(status: EnterMailStatus.onProcess));
    sendDecision();
  }

  void sendDecision() async {
    try {
      final result =
          await GetIt.I<SignRepository>().forgotPassword(state.mail!);
      if (result.data ?? false) {
        emit(state.copyWith(status: EnterMailStatus.success));
        AppCoordinator.showVerifyCodeScreen(state.mail!);
      }
    } catch (e) {
      xLog.e(e);
    }
  }
}
