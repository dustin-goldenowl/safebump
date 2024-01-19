import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/feature/calendar/logic/calendar_state.dart';
import 'package:safebump/src/network/data/note/note_repository.dart';
import 'package:safebump/src/network/model/calendar/calendar.dart';
import 'package:safebump/src/network/model/note/note.dart';
import 'package:safebump/src/utils/datetime_ext.dart';
import 'package:safebump/src/utils/datetime_utils.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:safebump/widget/calendar/month_calendar.dart';

class CalendarBloc extends Cubit<CalendarState> {
  CalendarBloc() : super(CalendarState(dateSelected: DateTime.now()));

  Future<void> inital(BuildContext context) async {
    emit(state.copyWith(status: CalendarStatus.loading));
    await _getAllDaysHaveNotes();
    _getNotesInSelectedDay(state.dateSelected);
  }

  Future<void> _getAllDaysHaveNotes() async {
    try {
      final result = await GetIt.I.get<NoteRepository>().getNotes();
      if (result.data == null) return;
      List<MCalendar> listDays = result.data!;
      Map<DateTime, List<NoteType>> daysHaveNote = _convertToMapNotes(listDays);
      emit(state.copyWith(
          listDaysHaveNotes: listDays,
          daysWithNoteType: daysHaveNote,
          status: CalendarStatus.normal));
    } catch (e) {
      xLog.e(e);
      emit(state.copyWith(status: CalendarStatus.error));
    }
  }

  Map<DateTime, List<NoteType>> _convertToMapNotes(List<MCalendar> listDays) {
    Map<DateTime, List<NoteType>> data = {};
    for (MCalendar day in listDays) {
      final key = DateTimeUtils.fromyMMMd(day.date);
      final value = _getListNoteType(day.notes);
      data.addEntries({key: value}.entries);
    }
    return data;
  }

  List<NoteType> _getListNoteType(List<MNote> day) {
    return day
        .map((e) => NoteType.toNoteTypeEnum(e.type))
        .toList()
        .toSet()
        .toList();
  }

  Future<void> _getNotesInSelectedDay(DateTime dateSelected) async {
    if (state.listDaysHaveNotes == null) return;
    try {
      final notes = state.listDaysHaveNotes!
          .where((element) => element.date.contains(dateSelected.toMMMdy))
          .first
          .notes;
      emit(state.copyWith(listSelectedDatesNotes: notes));
    } catch (e) {
      emit(state.copyWith(listSelectedDatesNotes: []));
      xLog.e(e);
    }
  }

  void onChangedDate(DateTime date) {
    emit(state.copyWith(dateSelected: date, listSelectedDatesNotes: []));
    _getNotesInSelectedDay(date);
  }
}
