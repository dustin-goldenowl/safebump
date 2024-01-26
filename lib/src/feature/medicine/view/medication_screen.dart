import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/feature/medicine/logic/medication_bloc.dart';
import 'package:safebump/src/feature/medicine/logic/medication_state.dart';
import 'package:safebump/src/feature/medicine/widget/set_up_medication_screen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';
import 'package:safebump/widget/button/fill_button.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({Key? key}) : super(key: key);

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen>
    with SingleTickerProviderStateMixin {
  var inited = false;

  @override
  void initState() {
    super.initState();
    context.read<MedicationBloc>().inital();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          _renderAppBar(context),
          BlocBuilder<MedicationBloc, MedicationState>(
            buildWhen: (previous, current) =>
                previous.status != current.status ||
                previous.listMedication != current.listMedication,
            builder: (context, state) {
              switch (state.status) {
                case MedicationScreenStatus.fail:
                  return _renderFailFetchQuestion();
                case MedicationScreenStatus.success:
                  return state.listMedication.isEmpty
                      ? const Expanded(child: SetupMedicationScreen())
                      : _renderMedicationContent();
                default:
                  return const SizedBox.shrink();
              }
            },
          )
        ],
      ),
    ));
  }

  Widget _renderFailFetchQuestion() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svg.emptyIllustratiom.svg(),
          Text(
            S.of(context).someThingWentWrong,
            style: const TextStyle(
                fontFamily: FontFamily.abel,
                fontSize: AppFontSize.f20,
                color: AppColors.black),
          ),
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
          XFillButton(
              onPressed: () => context.read<MedicationBloc>().inital(),
              label: Text(
                S.of(context).tryAgain,
                style: const TextStyle(
                  fontFamily: FontFamily.productSans,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f20,
                  color: AppColors.white,
                ),
              )),
          XPaddingUtils.verticalPadding(height: AppPadding.p45),
        ],
      ),
    );
  }

  Widget _renderMedicationContent() {
    return Column(
      children: [
        _renderHeaderMedication(),
        const SizedBox(height: AppSize.s10),
        _renderTabBarView(),
      ],
    );
  }

  Widget _renderAppBar(BuildContext context) {
    return XAppBarDashboard(
      title: S.of(context).medication,
      leading: IconButton(
        onPressed: () {
          AppCoordinator.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      isTitleCenter: true,
    );
  }

  Widget _renderTabBarView() {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: SingleChildScrollView(
        child: _renderMedicationList(context),
      ),
    ));
  }

  Widget _renderMedicationList(BuildContext context) {
    return Container();
  }

  Widget _renderHeaderMedication() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            S.of(context).medication,
            textScaler: TextScaler.noScaling,
            style: const TextStyle(
                fontFamily: FontFamily.abel,
                fontWeight: FontWeight.bold,
                fontSize: AppFontSize.f24,
                color: AppColors.black),
          ),
          IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {},
              icon: const Icon(
                Icons.add_circle_outline,
                color: AppColors.primary,
              )),
        ],
      ),
    );
  }
}
