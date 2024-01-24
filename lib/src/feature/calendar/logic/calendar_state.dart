import 'package:equatable/equatable.dart';
import 'package:safebump/src/network/model/calendar/calendar.dart';
import 'package:safebump/src/network/model/note/note.dart';
import 'package:safebump/widget/calendar/month_calendar.dart';

class CalendarState with EquatableMixin {
  CalendarState(
      {this.status = CalendarStatus.normal,
      required this.dateSelected,
      this.daysWithNoteType,
      this.listDaysHaveNotes,
      this.listSelectedDatesNotes});

  final CalendarStatus status;
  final DateTime dateSelected;
  final Map<DateTime, List<NoteType>>? daysWithNoteType;
  final List<MNote>? listSelectedDatesNotes;
  final List<MCalendar>? listDaysHaveNotes;
  CalendarState copyWith(
      {CalendarStatus? status,
      DateTime? dateSelected,
      List<MCalendar>? listDaysHaveNotes,
      Map<DateTime, List<NoteType>>? daysWithNoteType,
      List<MNote>? listSelectedDatesNotes}) {
    return CalendarState(
        status: status ?? this.status,
        listDaysHaveNotes: listDaysHaveNotes ?? this.listDaysHaveNotes,
        dateSelected: dateSelected ?? this.dateSelected,
        daysWithNoteType: daysWithNoteType ?? this.daysWithNoteType,
        listSelectedDatesNotes:
            listSelectedDatesNotes ?? this.listSelectedDatesNotes);
  }

  @override
  String toString() {
    return 'CalendarState{status=$status, dateSelected=$dateSelected, dateHaveNotes=$daysWithNoteType, listSelectedDatesNotes=$listSelectedDatesNotes}';
  }

  @override
  List<Object?> get props =>
      [status, dateSelected, daysWithNoteType, listSelectedDatesNotes];
}
