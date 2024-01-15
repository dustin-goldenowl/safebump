import 'package:safebump/src/network/model/baby_fact_model.dart';

class HomeState {
  final DateTime selectedDate;
  final Map<DateTime, BabyFactModel> babyFacts;

  HomeState({required this.selectedDate, required this.babyFacts});

  HomeState copyWith(
      {DateTime? selectedDate, Map<DateTime, BabyFactModel>? babyFacts}) {
    return HomeState(
        selectedDate: selectedDate ?? this.selectedDate,
        babyFacts: babyFacts ?? this.babyFacts);
  }
}
