import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/src/feature/home/logic/home_state.dart';
import 'package:safebump/src/network/model/baby_fact_model.dart';
import 'package:safebump/src/utils/datetime_utils.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc(Map<DateTime, BabyFactModel> babyFacts)
      : super(HomeState(
            selectedDate: DateTimeUtils.convertToStartedDay(DateTime.now()),
            babyFacts: babyFacts));

  void onChangedSelectedDate(DateTime date) {
    emit(state.copyWith(selectedDate: DateTimeUtils.convertToStartedDay(date)));
  }
}
