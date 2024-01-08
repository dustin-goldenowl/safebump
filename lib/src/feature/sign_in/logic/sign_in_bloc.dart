import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:safebump/src/feature/sign_in/logic/sign_in_state.dart';
import 'package:safebump/src/network/model/domain_manager.dart';

class SignInBloc extends Cubit<SignInState> {
  SignInBloc() : super(SignInState());

  DomainManager get domain => DomainManager();

  Future loginWithEmail(BuildContext context) async {
    if (state.status == SignInStatus.signingIn) return;
    if (state.isValidated == false) {
      return;
    }
    emit(state.copyWith(
      status: FormzSubmissionStatus.inProgress,
      loginType: MSocialType.email,
    ));
    final email = state.email;
    final password = state.password;
    final result =
        await domain.sign.loginWithEmail(email: email, password: password);
    return loginDecision(context, result);
  }

  void onChangedEmail(String email) {
    emit(state.copyWith(email: email));
  }

  void onChangedPassword(String pass) {
    emit(state.copyWith(password: pass));
  }
}
