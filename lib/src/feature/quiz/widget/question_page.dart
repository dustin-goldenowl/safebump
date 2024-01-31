import 'package:flutter/material.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/network/model/quiz/question.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/decorations.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';

class XQuestionPage extends StatefulWidget {
  final MQuestion question;
  final String userAnswer;
  final Function(String) onTapAnswer;
  final int numberQuestion;
  final int totalQuestion;
  const XQuestionPage({
    super.key,
    required this.question,
    required this.userAnswer,
    required this.onTapAnswer,
    required this.numberQuestion,
    required this.totalQuestion,
  });

  @override
  State<XQuestionPage> createState() => _XQuestionPageState();
}

class _XQuestionPageState extends State<XQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _renderQuestionSection(),
        XPaddingUtils.verticalPadding(height: AppPadding.p20),
        _renderAnswerSection(
            answer: widget.question.firstAnswer, isFirst: true),
        XPaddingUtils.verticalPadding(height: AppPadding.p16),
        _renderAnswerSection(
            answer: widget.question.secondAnswer, isFirst: false),
      ],
    );
  }

  Widget _renderQuestionSection() {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        color: AppColors.primary,
        boxShadow: AppDecorations.shadow,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p6),
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(AppRadius.r8),
            ),
            child: Text(
              "${widget.numberQuestion}/${widget.totalQuestion}",
              style: const TextStyle(
                  fontFamily: FontFamily.inter,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
              textScaler: TextScaler.noScaling,
            ),
          ),
          XPaddingUtils.verticalPadding(height: AppPadding.p23),
          Text(
            widget.question.question,
            style: const TextStyle(
              fontFamily: FontFamily.inter,
              fontWeight: FontWeight.bold,
              fontSize: AppFontSize.f20,
              color: AppColors.white,
            ),
            textScaler: TextScaler.noScaling,
          )
        ],
      ),
    );
  }

  Widget _renderAnswerSection({required String answer, required bool isFirst}) {
    return GestureDetector(
      onTap: () {
        widget.onTapAnswer(answer);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
            vertical: AppPadding.p16, horizontal: AppPadding.p10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r10),
          border: widget.userAnswer == answer
              ? Border.all(color: AppColors.subPrimary)
              : Border.all(color: AppColors.hintTextColor, width: 0.5),
        ),
        child: Text(
          "${isFirst ? "A." : "B."} $answer",
          style: TextStyle(
              fontFamily: FontFamily.inter,
              color: widget.userAnswer == answer
                  ? AppColors.subPrimary
                  : AppColors.black),
          textScaler: TextScaler.noScaling,
        ),
      ),
    );
  }
}
