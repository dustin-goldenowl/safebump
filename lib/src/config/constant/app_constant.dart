import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/src/network/model/on_boarding_model.dart';
import 'package:safebump/src/localization/localization_utils.dart';

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
}
