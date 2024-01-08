import 'package:equatable/equatable.dart';

enum SignInStatus { init, signingIn, failed, successed }

class SignInState with EquatableMixin {
  SignInState(
      {this.status = SignInStatus.init,
      this.email,
      this.emailValidated,
      this.password,
      this.passwordValidated});

  final String? email;
  final String? emailValidated;
  final String? password;
  final String? passwordValidated;
  final SignInStatus status;

  @override
  List<Object?> get props =>
      [email, emailValidated, password, passwordValidated, status];

  SignInState copyWith(
      {String? email,
      String? emailValidated,
      String? password,
      String? passwordValidated,
      SignInStatus? status}) {
    return SignInState(
        email: email ?? this.email,
        emailValidated: emailValidated ?? this.emailValidated,
        password: password ?? this.password,
        passwordValidated: passwordValidated ?? this.passwordValidated,
        status: status ?? this.status);
  }
}
