import 'package:equatable/equatable.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/baby_fact_model.dart';

class HomeState with EquatableMixin {
  final DateTime selectedDate;
  final Map<DateTime, BabyFactModel> babyFacts;
  final bool hasBaby;
  final MBaby? baby;
  final String? weekCounter;

  HomeState(
      {required this.selectedDate,
      required this.babyFacts,
      this.baby,
      this.weekCounter,
      this.hasBaby = false});

  HomeState copyWith(
      {DateTime? selectedDate,
      Map<DateTime, BabyFactModel>? babyFacts,
      MBaby? baby,
      String? weekCounter,
      bool? hasBaby}) {
    return HomeState(
        selectedDate: selectedDate ?? this.selectedDate,
        hasBaby: hasBaby ?? this.hasBaby,
        baby: baby ?? this.baby,
        weekCounter: weekCounter ?? this.weekCounter,
        babyFacts: babyFacts ?? this.babyFacts);
  }

  @override
  List<Object?> get props =>
      [selectedDate, babyFacts, hasBaby, baby, weekCounter];
}
