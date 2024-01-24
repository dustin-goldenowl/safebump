import 'package:safebump/src/network/model/calendar/calendar.dart';
import 'package:safebump/src/network/model/common/result.dart';

abstract class NoteRepository {
  Future<MResult<MCalendar>> getNoteInDate(DateTime date);
  Future<MResult<MCalendar>> getOrAddUser(MCalendar notes);
  Future<MResult<List<MCalendar>>> getNotes();
}
