import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.white4,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_renderAppbar(context), _renderHelloUser(context)],
        ),
      ),
    );
  }

  Widget _renderAppbar(BuildContext context) {
    return XAppBarDashboard(
      leading: Assets.images.images.logo.image(width: AppSize.s20),
      action: _renderNotyIcon(),
      title: S.of(context).home,
      isTitleCenter: true,
    );
  }

  Widget _renderNotyIcon() {
    return IconButton(
        onPressed: () {
          // TODO: event action
        },
        icon: const Icon(
          Icons.notifications_active_outlined,
          size: AppSize.s20,
        ));
  }

  Widget _renderHelloUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p10),
      child: Text(
        "${S.of(context).hello} Lance",
        style: const TextStyle(
            fontFamily: FontFamily.productSans,
            fontSize: AppFontSize.f14,
            color: AppColors.hintTextColor),
      ),
    );
  }
}
