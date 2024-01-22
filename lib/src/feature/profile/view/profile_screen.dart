import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/decorations.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/datetime_utils.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';
import 'package:safebump/widget/avatar/avatar.dart';
import 'package:safebump/widget/card/card_item_with_icon.dart';
import 'package:safebump/widget/separator/solid_separator.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin<ProfileScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        // context.read<ProfileBloc>().updateAppSyncedState();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: AppColors.white4,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _renderAppbar(context),
              Column(
                children: [
                  XPaddingUtils.verticalPadding(height: AppPadding.p8),
                  _renderInformationCard(context),
                  XPaddingUtils.verticalPadding(height: AppPadding.p16),
                  _renderAboutSettingsCard(),
                  XPaddingUtils.verticalPadding(height: AppPadding.p16),
                ],
              ),
              _renderLogOutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderAppbar(BuildContext context) {
    return XAppBarDashboard(
      leading: Assets.images.images.logo.image(width: AppSize.s20),
      title: S.of(context).profile,
      isTitleCenter: true,
    );
  }

  Widget _renderInformationCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppDecorations.shadow,
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.r8),
        ),
        elevation: AppElevation.ev0,
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: Column(
            children: [
              _renderAvatarRow(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p16),
              const XSolidSeparator(),
              _renderAgeRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderAvatarRow(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _renderAvatar(),
        XPaddingUtils.horizontalPadding(width: AppPadding.p16),
        _renderNameAndEmail(),
      ],
    );
  }

  Widget _renderAgeRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _renderAgeRowItem(
              DateTimeUtils.calculateAge(
                  DateTime.now().subtract(const Duration(days: 3650))),
              S.of(context).age),
          _renderAgeRowItem(150.toString(), S.of(context).heightCm),
          _renderAgeRowItem(150.toString(), S.of(context).weightKg),
        ],
      ),
    );
  }

  Widget _renderAgeRowItem(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.black,
            fontSize: AppFontSize.f20,
            fontFamily: FontFamily.abel,
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.hintTextColor,
            fontSize: AppFontSize.f16,
            fontFamily: FontFamily.abel,
          ),
        ),
      ],
    );
  }

  Widget _renderAboutSettingsCard() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: AppDecorations.shadow,
        borderRadius: BorderRadius.circular(AppRadius.r8),
      ),
      child: Card(
        elevation: AppElevation.ev0,
        child: Column(
          children: [
            XCardItemWithIcon(
              text: S.of(context).aboutSafeBump,
              firstItem: true,
              iconPath: Icons.arrow_forward_ios_outlined,
              onTap: () {
                // TODO: Add navigation
              },
            ),
            const XSolidSeparator(),
            XCardItemWithIcon(
              text: S.of(context).settings,
              lastItem: true,
              iconPath: Icons.arrow_forward_ios_outlined,
              onTap: () {
                // TODO: Add navigation
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderLogOutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(
            width: AppSize.s2,
            color: AppColors.primary,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.r10)),
          minimumSize: const Size(
            double.infinity,
            AppSize.s40,
          ),
        ),
        onPressed: () {
          // TODO: Add logic sign out
        },
        child: Text(
          S.of(context).signOut,
          style: const TextStyle(
            fontFamily: FontFamily.abel,
            fontWeight: FontWeight.bold,
            color: AppColors.primary,
            fontSize: AppFontSize.f20,
          ),
        ),
      ),
    );
  }

  Widget _renderAvatar() {
    return XAvatar(
      key: UniqueKey(),
      firstName: S.of(context).safeBump,
      lastName: S.of(context).safeBump,
    );
  }

  Widget _renderNameAndEmail() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              _renderUserName(),
              _renderEditButton(),
            ],
          ),
          _renderEmailUser()
        ],
      ),
    );
  }

  Widget _renderUserName() {
    // workaround - https://github.com/flutter/flutter/issues/18761
    final userName = S.of(context).safeBump.replaceAll('', '\u{200B}');

    return Expanded(
      // Use layout builder get maxWidth of expand
      child: LayoutBuilder(
        builder: (context, constraints) {
          return _renderTextUserName(constraints, userName: userName);
        },
      ),
    );
  }

  Widget _renderTextUserName(BoxConstraints constraints,
      {String userName = ''}) {
    return Text(
      userName,
      style: const TextStyle(
        color: AppColors.primary,
        fontFamily: FontFamily.inter,
        fontWeight: FontWeight.bold,
        fontSize: AppFontSize.f20,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _renderEditButton() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: AppSize.s30,
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.subPrimary,
            borderRadius: BorderRadius.circular(AppRadius.r8)),
        width: AppSize.s30,
        height: AppSize.s30,
        child: IconButton(
          onPressed: () {
            AppCoordinator.showEditProfileScreen()
                .then((value) => xLog.e(value));
          },
          icon: Assets.svg.icEdit.svg(),
        ),
      ),
    );
  }

  Widget _renderEmailUser() {
    return Text(
      S.of(context).safeBump,
      style: const TextStyle(
        color: AppColors.hintTextColor,
        fontFamily: FontFamily.inter,
        fontSize: AppFontSize.f16,
      ),
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}
