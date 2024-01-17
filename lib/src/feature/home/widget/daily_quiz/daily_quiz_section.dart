import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/model/daily_quiz.dart/daily_quiz.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/widget/button/fill_button.dart';

class DailyQuizSection extends StatelessWidget {
  const DailyQuizSection(
      {super.key,
      required this.quiz,
      required this.isAnswer,
      required this.onTapAnswer});
  final DailyQuiz quiz;
  final bool isAnswer;
  final Function(String) onTapAnswer;

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
    return Row(
      children: [
        const Icon(
          Icons.question_answer_rounded,
          color: AppColors.primary,
          size: AppSize.s20,
        ),
        Text(S.of(context).testYourKnowledge),
      ],
    );
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p15),
      child: Text(
        quiz.question,
        style: const TextStyle(
            fontSize: AppFontSize.f30,
            fontWeight: FontWeight.bold,
            color: AppColors.black),
      ),
    );
  }

  Widget _renderListAnswers() {
    return Column(
      children: [
        for (int index = 0; index < quiz.answers.length; index++)
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p10),
            child: XFillButton(
                onPressed: () => onTapAnswer(quiz.answers[index]),
                bgColor: AppColors.grey5,
                aligmentRowLabel: MainAxisAlignment.start,
                label: _renderAnswer(index)),
          )
      ],
    );
  }

  Widget _renderAnswer(int index) {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: AppFontSize.f20,
          fontFamily: FontFamily.abel,
          color: AppColors.black),
      child: Row(
        children: [
          Text("${String.fromCharCodes([65 + index])}. "),
          Text(quiz.answers[index])
        ],
      ),
    );
  }
}
