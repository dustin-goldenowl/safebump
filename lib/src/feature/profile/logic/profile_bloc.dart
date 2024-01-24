import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/profile/logic/profile_state.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/services/user_prefs.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState(user: _initUser()));

  static MUser _initUser() {
    final user = UserPrefs.I.getUser();
    if (user == null) return MUser.empty();
    return user;
  }

  void updateProfile() {
    emit(state.copyWith(user: _initUser()));
  }
}
