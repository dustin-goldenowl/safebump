import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/src/dialogs/toast_wrapper.dart';
import 'package:safebump/src/feature/account/bloc/account_bloc.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/data/user/user_repository.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/services/user_prefs.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/string_utils.dart';
import 'package:safebump/src/utils/utils.dart';

class SyncDataScreen extends StatefulWidget {
  const SyncDataScreen({super.key});

  @override
  State<SyncDataScreen> createState() => _SyncDataScreenState();
}

class _SyncDataScreenState extends State<SyncDataScreen> {
  @override
  void initState() {
    super.initState();
    _syncData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: Assets.jsons.syncData.lottie(),
      )),
    );
  }

  void _syncData() {
    _checkUserToken();
  }

  Future<void> _checkUserToken() async {
    final token = UserPrefs.I.getToken();
    if (StringUtils.isNullOrEmpty(token)) {
      AppCoordinator.showSignInScreen();
    }
    try {
      Future.delayed(
          const Duration(
            seconds: 20,
          ), () async {
        final result = await FirebaseAuth.instance.currentUser?.getIdToken();
        if (result != null && result == token) {
          await _syncDataFromFirebase();
          AppCoordinator.showHomeScreen();
        }
      });
    } catch (e) {
      xLog.e(e);
      XToast.error(S.of(context).yourSignInIsSInvalid);
      AppCoordinator.showSignInScreen();
    }
  }

  Future<void> _syncDataFromFirebase() async {
    var sharePrefUser = UserPrefs.I.getUser();
    if (sharePrefUser == null) {
      try {
        sharePrefUser = await GetIt.I<UserRepository>()
            .getUser()
            .then((value) => value.data);
      } catch (e) {
        xLog.e(e);
        sharePrefUser = const MUser(id: 'id');
      }
    }
    // ignore: use_build_context_synchronously
    context.read<AccountBloc>().inital(context, sharePrefUser!);
  }
}
