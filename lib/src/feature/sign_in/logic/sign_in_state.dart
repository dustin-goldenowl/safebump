import 'package:equatable/equatable.dart';
import 'package:safebump/src/network/model/social_type.dart';

enum SignInStatus { init, signingIn, failed, successed }

class SignInState with EquatableMixin {
  SignInState(
      {this.status = SignInStatus.init,
      this.email,
      this.emailValidated,
      this.password,
      this.loginType,
      this.passwordValidated});

  final String? email;
  final String? emailValidated;
  final String? password;
  final String? passwordValidated;
  final SignInStatus status;
  final MSocialType? loginType;

  @override
  List<Object?> get props =>
      [email, emailValidated, password, passwordValidated, status, loginType];

  SignInState copyWith(
      {String? email,
      String? emailValidated,
      String? password,
      MSocialType? loginType,
      String? passwordValidated,
      SignInStatus? status}) {
    return SignInState(
        email: email ?? this.email,
        emailValidated: emailValidated ?? this.emailValidated,
        password: password ?? this.password,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        loginType: loginType ?? this.loginType,
        status: status ?? this.status);
  }
}
