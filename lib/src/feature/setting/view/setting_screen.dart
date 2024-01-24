import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/feature/edit_profile/widget/unit_segment.dart';
import 'package:safebump/src/feature/setting/widget/unit_segment_with_title.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';
import 'package:safebump/widget/card/card_item_with_icon.dart';
import 'package:safebump/widget/separator/solid_separator.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen>
    with WidgetsBindingObserver {
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
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: _renderBody(),
      ),
    );
  }

  _onSelectUnitSection(MeasurementUnitType? type) async {
    //TODO: And unit
  }

  Widget _renderBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _renderAppBar(),
              const SizedBox(height: AppSize.s24),
              _renderUnits(),
              _renderAccount()
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return XAppBarDashboard(
      title: S.of(context).settings,
      isTitleCenter: true,
      leading: IconButton(
          onPressed: () {
            AppCoordinator.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: AppSize.s20,
          )),
    );
  }

  Widget _renderBodyMeasurementUnit() {
    return XUnitSegmentWithTitle(
        title: S.of(context).bodyMeasurement,
        unitType: MeasurementUnitType.metric,
        metricText: S.of(context).kgCm,
        imperialText: S.of(context).lbFt,
        onTap: _onSelectUnitSection);
  }

  Widget _renderUnits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _renderIconWithTitle(Icons.av_timer_rounded, S.of(context).units),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        _renderBodyMeasurementUnit(),
        XPaddingUtils.verticalPadding(height: AppPadding.p23),
      ],
    );
  }

  Widget _renderAccount() {
    return Column(
      children: [
        _renderIconWithTitle(
          Icons.person,
          S.of(context).account,
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        SizedBox(
          height: AppSize.s48,
          child: XCardItemWithIcon(
              text: S.of(context).language,
              iconPath: Icons.keyboard_arrow_right_rounded,
              paddingItem: const EdgeInsets.only(right: AppPadding.p6),
              onTap: () {
                // TODO: Show model bottom sheet change language
              }),
        ),
        SizedBox(
          height: AppSize.s48,
          child: XCardItemWithIcon(
              text: S.of(context).deleteAccount,
              iconPath: Icons.keyboard_arrow_right_rounded,
              paddingItem: const EdgeInsets.only(right: AppPadding.p6),
              onTap: () {
                // TODO: Show delete account pop up
              }),
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p23),
      ],
    );
  }

  Widget _renderIconWithTitle(IconData icon, String title) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                  left: AppPadding.p2,
                  right: AppPadding.p10,
                ),
                child: Icon(icon)),
            Text(
              title,
              style: const TextStyle(
                fontFamily: FontFamily.inter,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                fontSize: AppFontSize.f20,
              ),
            ),
          ],
        ),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        const XSolidSeparator(),
      ],
    );
  }
}
