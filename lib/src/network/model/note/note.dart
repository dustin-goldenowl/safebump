import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.g.dart';

@JsonSerializable(explicitToJson: true)
class MNote {
  String title;
  String? detail;
  String? hospital;
  String type;
  String? medicine;
  DateTime? time;
  DateTime? remindTime;

  MNote(
      {required this.title,
      required this.type,
      this.detail,
      this.hospital,
      this.medicine,
      this.time,
      this.remindTime});

  factory MNote.fromJson(Map<String, dynamic> json) => _$MNoteFromJson(json);

  Map<String, dynamic> toJson() => _$MNoteToJson(this);

@override
String toString() {
    return 'MNote{title=$title, detail=$detail, hospital=$hospital, type=$type, medicine=$medicine, time=$time, remindTime=$remindTime}';
  }
}
