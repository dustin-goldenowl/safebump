import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/feature/calendar/logic/calendar_bloc.dart';
import 'package:safebump/src/feature/calendar/logic/calendar_state.dart';
import 'package:safebump/src/feature/calendar/widget/note_item.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/model/note/note.dart';
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
    context.read<CalendarBloc>().inital(context);
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
    return BlocBuilder<CalendarBloc, CalendarState>(
      builder: (context, state) {
        return XMonthCalendar(
          selectingDay: state.dateSelected,
          data: state.daysWithNoteType ?? {},
          onDaySelected: (date) =>
              context.read<CalendarBloc>().onChangedDate(date),
          minDate: DateTime.now().subtract(const Duration(days: 200)),
          calendarState: state.status,
        );
      },
    );
  }

  Widget _renderDaysNotes(BuildContext context) {
    return BlocBuilder<CalendarBloc, CalendarState>(
      buildWhen: (previous, current) =>
          previous.status != current.status ||
          previous.dateSelected != current.dateSelected ||
          previous.listSelectedDatesNotes != current.listSelectedDatesNotes,
      builder: (context, state) {
        return state.status == CalendarStatus.normal
            ? Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(AppPadding.p8),
                decoration: BoxDecoration(
                    boxShadow: AppDecorations.shadow,
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(AppRadius.r10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _renderHeaderNote(context),
                  ]
                      .followedBy(state.listSelectedDatesNotes != null
                          ? _renderListNoteItem(
                              state.listSelectedDatesNotes ?? [])
                          : [const SizedBox.shrink()])
                      .toList(),
                ),
              )
            : const SizedBox.shrink();
      },
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

  List<Widget> _renderListNoteItem(List<MNote> listNotes) {
    List<Widget> listNotesWidget = [];
    for (MNote note in listNotes) {
      listNotesWidget.add(_renderNoteItem(note));
    }
    return listNotesWidget;
  }

  Widget _renderNoteItem(MNote note) {
    return XNoteItem(note: note);
  }
}
