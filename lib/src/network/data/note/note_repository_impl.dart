import 'package:safebump/src/network/data/note/note_reference.dart';
import 'package:safebump/src/network/data/note/note_repository.dart';
import 'package:safebump/src/network/model/calendar/calendar.dart';
import 'package:safebump/src/network/model/common/result.dart';

class NoteRepositoryImpl extends NoteRepository {
  final notesRef = NoteReference();
  @override
  Future<MResult<MCalendar>> getNoteInDate(DateTime date) async {
    final calendar = await notesRef.getNote(date);
    return MResult.success(calendar.data);
  }

  @override
  Future<MResult<MCalendar>> getOrAddUser(MCalendar notes) {
    return notesRef.getOrAddUser(notes);
  }

  @override
  Future<MResult<List<MCalendar>>> getNotes() {
    return notesRef.getNotes();
  }
}
