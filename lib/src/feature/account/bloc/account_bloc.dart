import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/account/bloc/account_state.dart';
import 'package:safebump/src/services/user_prefs.dart';

class AccountBloc extends Cubit<AccountState> {
  AccountBloc() : super(AccountState());

  void inital(BuildContext context) async {
    _getUser();
  }

  void _getUser() async {
    final sharePrefUser = UserPrefs.I.getUser();
    emit(state.copyWith(account: sharePrefUser));
  }
}
