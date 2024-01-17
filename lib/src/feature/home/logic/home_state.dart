import 'package:equatable/equatable.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/baby_fact_model.dart';
import 'package:safebump/src/network/model/daily_quiz.dart/daily_quiz.dart';

class HomeState with EquatableMixin {
  final DateTime selectedDate;
  final Map<DateTime, BabyFactModel> babyFacts;
  final bool hasBaby;
  final MBaby? baby;
  final String? weekCounter;
  final bool isAnswerDailyQuiz;
  final DailyQuiz? quiz;
  final bool isAnswerCorrect;
  final int correctPercent;

  HomeState(
      {required this.selectedDate,
      required this.babyFacts,
      this.baby,
      this.isAnswerDailyQuiz = false,
      this.quiz,
      this.weekCounter,
      this.correctPercent = 0,
      this.isAnswerCorrect = false,
      this.hasBaby = false});

  HomeState copyWith(
      {DateTime? selectedDate,
      Map<DateTime, BabyFactModel>? babyFacts,
      MBaby? baby,
      String? weekCounter,
      bool? isAnswerDailyQuiz,
      bool? isAnswerCorrect,
      DailyQuiz? quiz,
      int? correctPercent,
      bool? hasBaby}) {
    return HomeState(
        selectedDate: selectedDate ?? this.selectedDate,
        hasBaby: hasBaby ?? this.hasBaby,
        baby: baby ?? this.baby,
        weekCounter: weekCounter ?? this.weekCounter,
        isAnswerDailyQuiz: isAnswerDailyQuiz ?? this.isAnswerDailyQuiz,
        quiz: quiz ?? this.quiz,
        correctPercent: correctPercent ?? this.correctPercent,
        isAnswerCorrect: isAnswerCorrect ?? this.isAnswerCorrect,
        babyFacts: babyFacts ?? this.babyFacts);
  }

  @override
  List<Object?> get props => [
        selectedDate,
        babyFacts,
        hasBaby,
        baby,
        weekCounter,
        isAnswerDailyQuiz,
        quiz,
        isAnswerCorrect,
        correctPercent
      ];
}
