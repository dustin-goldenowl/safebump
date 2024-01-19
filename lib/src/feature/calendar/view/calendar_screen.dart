import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/decorations.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';
import 'package:safebump/widget/calendar/month_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.white4,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _renderAppbar(context),
              _renderCalendar(context),
              XPaddingUtils.verticalPadding(height: AppPadding.p15),
              _renderDaysNotes(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderAppbar(BuildContext context) {
    return XAppBarDashboard(
      leading: Assets.images.images.logo.image(width: AppSize.s20),
      action: _renderAddIcon(),
      title: S.of(context).calendar,
      isTitleCenter: true,
    );
  }

  Widget _renderAddIcon() {
    return IconButton(
        onPressed: () {
          // TODO: event action
        },
        icon: const Icon(
          Icons.edit_calendar_outlined,
          size: AppSize.s20,
        ));
  }

  Widget _renderCalendar(BuildContext context) {
    return XMonthCalendar(
      data: [DateTime.now(), DateTime.now().subtract(const Duration(days: 1))],
      onDaySelected: (date) => {
        // Todo: Add event change day
      },
      minDate: DateTime.now().subtract(const Duration(days: 200)),
      calendarState: CalendarState.loading,
    );
  }

  Widget _renderDaysNotes(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          boxShadow: AppDecorations.shadow,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppRadius.r10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_renderHeaderNote(context)],
      ),
    );
  }

  Widget _renderHeaderNote(BuildContext context) {
    return Text(
      S.of(context).notesCreated,
      style: const TextStyle(
        fontFamily: FontFamily.abel,
        fontSize: AppFontSize.f20,
      ),
    );
  }
}
