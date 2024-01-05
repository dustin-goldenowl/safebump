import 'package:safebump/src/network/model/on_boarding_model.dart';
import 'package:safebump/src/theme/images.dart';
import 'package:safebump/src/theme/text.dart';

class AppConstant {
  static final listDataOfOnBoarding = <OnBoardingModel>[
    OnBoardingModel(
        fistTitle: AppString.safe,
        secondTitle: AppString.bump,
        image: AppImage.welcomeSafeBump,
        content: AppString.welcomeToSafeBump),
    OnBoardingModel(
        fistTitle: AppString.tracking,
        secondTitle: AppString.tools,
        image: AppImage.provideTracking,
        content: AppString.theAppWillProvideTracking),
    OnBoardingModel(
        fistTitle: AppString.educational,
        secondTitle: AppString.resources,
        image: AppImage.proviceEducational,
        content: AppString.theAppWillProvideEducational),
    OnBoardingModel(
        fistTitle: AppString.community,
        secondTitle: AppString.support,
        image: AppImage.provideCommunity,
        content: AppString.theAppWillProvideACommunity),
    OnBoardingModel(
        fistTitle: AppString.appointment,
        secondTitle: AppString.scheduler,
        image: AppImage.scheduleManager,
        content: AppString.theAppWillAllowUser),
  ];
}
