import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/feature/home/logic/home_state.dart';
import 'package:safebump/src/local/database_app.dart';
import 'package:safebump/src/local/repo/baby_infor_local_repo.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/baby_fact_model.dart';
import 'package:safebump/src/utils/datetime_utils.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(Map<DateTime, BabyFactModel> babyFacts)
      : super(HomeState(
            selectedDate: DateTimeUtils.convertToStartedDay(DateTime.now()),
            babyFacts: babyFacts));

  void initData(BuildContext context) {
    _hasBabyInfor();
  }

  void onChangedSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: DateTimeUtils.convertToStartedDay(date)));
  }

  Future<void> _hasBabyInfor() async {
    final babyLocalRepo = GetIt.I.get<BabyInforLocalRepo>();
    final babyLocal = await babyLocalRepo.getAllDetails().get();
    if (babyLocal.isEmpty) {
      emit(state.copyWith(hasBaby: false));
    }
    _setBabyInfor(babyLocal.first);
    emit(state.copyWith(hasBaby: true));
  }

  void _setBabyInfor(BabyInforEntityData babyLocal) {
    emit(state.copyWith(
        baby: MBaby(
      id: babyLocal.id,
      name: babyLocal.name,
      type: babyLocal.type,
      date: babyLocal.date,
      gender: babyLocal.gender,
      weight: babyLocal.weight,
      height: babyLocal.height,
    )));
    _getWeekCounter();
  }

  void _getWeekCounter() {
    String weekCounter;
    int weekNumber;
    final today = DateTime.now();
    final startedPregnancyDay = state.baby!.date!.subtract(Duration(days: 280));
    if (today.year == startedPregnancyDay.year) {
      weekNumber = DateTimeUtils.weekNumber(today) -
          DateTimeUtils.weekNumber(startedPregnancyDay);
    } else {
      final numberWeekOfYear =
          DateTimeUtils.numOfWeeksOfYear(startedPregnancyDay.year);
      weekNumber = DateTimeUtils.weekNumber(today) +
          (numberWeekOfYear - DateTimeUtils.weekNumber(startedPregnancyDay));
    }

    switch (weekNumber % 10) {
      case 1:
        weekCounter = "${weekNumber}st ";
      case 2:
        weekCounter = "${weekNumber}nd ";
      case 3:
        weekCounter = "${weekNumber}rd ";
      default:
        weekCounter = "${weekNumber}th ";
    }
    emit(state.copyWith(weekCounter: weekCounter));
  }
}
