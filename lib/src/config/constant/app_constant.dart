import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/src/config/enum/baby_type_enum.dart';
import 'package:safebump/src/network/model/baby_fact_model.dart';
import 'package:safebump/src/network/model/extension_model.dart';
import 'package:safebump/src/network/model/on_boarding_model.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/route_name.dart';
import 'package:safebump/src/services/user_prefs.dart';
import 'package:safebump/src/utils/datetime_utils.dart';

class AppConstant {
  static List<OnBoardingModel> getListDataOfOnBoarding(BuildContext context) =>
      <OnBoardingModel>[
        OnBoardingModel(
            fistTitle: S.of(context).safe,
            secondTitle: S.of(context).bump,
            image: Assets.images.images.welcomeSafebump.path,
            content: S.of(context).welcomeToSafeBump),
        OnBoardingModel(
            fistTitle: S.of(context).tracking,
            secondTitle: S.of(context).tools,
            image: Assets.images.images.provideTracking.path,
            content: S.of(context).theAppWillProvideTracking),
        OnBoardingModel(
            fistTitle: S.of(context).educational,
            secondTitle: S.of(context).resources,
            image: Assets.images.images.proviceEducational.path,
            content: S.of(context).theAppWillProvideEducational),
        OnBoardingModel(
            fistTitle: S.of(context).community,
            secondTitle: S.of(context).support,
            image: Assets.images.images.provideCommunity.path,
            content: S.of(context).theAppWillProvideACommunity),
        OnBoardingModel(
            fistTitle: S.of(context).appointment,
            secondTitle: S.of(context).scheduler,
            image: Assets.images.images.scheduleManager.path,
            content: S.of(context).theAppWillAllowUser),
      ];

  static List<ExtensionModel> getListExtensionData(BuildContext context) => [
        ExtensionModel(
            label: S.of(context).medicines,
            routeName: AppRouteNames.dashboard.name,
            icon: Icons.medical_information),
        ExtensionModel(
            label: S.of(context).exercises,
            routeName: AppRouteNames.dashboard.name,
            icon: Icons.pregnant_woman_outlined),
        ExtensionModel(
            label: S.of(context).quiz,
            routeName: AppRouteNames.dashboard.name,
            icon: Icons.quiz),
        ExtensionModel(
            label: S.of(context).articles,
            routeName: AppRouteNames.articles.name,
            icon: Icons.article),
        ExtensionModel(
            label: S.of(context).videos,
            routeName: AppRouteNames.dashboard.name,
            icon: Icons.video_collection_rounded),
        ExtensionModel(
            label: S.of(context).food,
            routeName: AppRouteNames.dashboard.name,
            icon: Icons.food_bank)
      ];

  static Map<DateTime, BabyFactModel> getBabyFactsData() {
    final pergnancyDate =
        DateTimeUtils.convertToStartedDay(UserPrefs.I.getPergnancyDay());
    Map<DateTime, BabyFactModel> babyFacts = {};
    for (int i = 0; i < 7; i++) {
      babyFacts.addEntries({
        pergnancyDate.add(Duration(days: i)): BabyFactModel(
            fact: S.text.yourBabySizeofpear,
            height: 105 - i + 17,
            weight: 105 - i + 110,
            daysLeft: 280 - i),
      }.entries);
    }
    return babyFacts;
  }

  static List<DropdownMenuItem<Gender>> getListGender(BuildContext context) => [
        DropdownMenuItem(
          value: Gender.male,
          child: Text(
            Gender.male.getBabyGenderText(context),
          ),
        ),
        DropdownMenuItem(
          value: Gender.female,
          child: Text(
            Gender.female.getBabyGenderText(context),
          ),
        ),
      ];
}
