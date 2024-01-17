import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/model/daily_quiz.dart/daily_quiz.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/widget/button/fill_button.dart';

class DailyQuizSection extends StatelessWidget {
  const DailyQuizSection(
      {super.key, required this.quiz, required this.isAnswer});
  final DailyQuiz quiz;
  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontFamily: FontFamily.abel,
          fontSize: AppFontSize.f16,
          color: AppColors.hintTextColor),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppMargin.m20),
        padding: const EdgeInsets.all(AppPadding.p15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r10),
            color: AppColors.white),
        child: Column(
          children: [
            _renderTitleOfSection(context),
            isAnswer
                ? _renderResultSection(context)
                : _renderQuestionSection(context),
          ],
        ),
      ),
    );
  }

  Widget _renderTitleOfSection(BuildContext context) {
    return Text(S.of(context).testYourKnowledge);
  }

  Widget _renderResultSection(BuildContext context) {
    return Container();
  }

  Widget _renderQuestionSection(BuildContext context) {
    return Column(
      children: [
        _renderQuestion(),
        _renderListAnswers(),
      ],
    );
  }

  Widget _renderQuestion() {
    return Text(quiz.question);
  }

  Widget _renderListAnswers() {
    return Column(
      children: [
        for (final answer in quiz.answers) XFillButton(label: Text(answer))
      ],
    );
  }
}
