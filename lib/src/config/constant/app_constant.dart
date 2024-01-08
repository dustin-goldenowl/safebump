import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/src/network/model/on_boarding_model.dart';
import 'package:safebump/src/localization/localization_utils.dart';

class AppConstant {
  static final listDataOfOnBoarding = <OnBoardingModel>[
    OnBoardingModel(
        fistTitle: S.text.safe,
        secondTitle: S.text.bump,
        image: Assets.images.images.welcomeSafebump.path,
        content: S.text.welcomeToSafeBump),
    OnBoardingModel(
        fistTitle: S.text.tracking,
        secondTitle: S.text.tools,
        image: Assets.images.images.provideTracking.path,
        content: S.text.theAppWillProvideTracking),
    OnBoardingModel(
        fistTitle: S.text.educational,
        secondTitle: S.text.resources,
        image: Assets.images.images.proviceEducational.path,
        content: S.text.theAppWillProvideEducational),
    OnBoardingModel(
        fistTitle: S.text.community,
        secondTitle: S.text.support,
        image: Assets.images.images.provideCommunity.path,
        content: S.text.theAppWillProvideACommunity),
    OnBoardingModel(
        fistTitle: S.text.appointment,
        secondTitle: S.text.scheduler,
        image: Assets.images.images.scheduleManager.path,
        content: S.text.theAppWillAllowUser),
  ];
}
