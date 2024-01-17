import 'package:freezed_annotation/freezed_annotation.dart';

part 'baby.freezed.dart';
part 'baby.g.dart';

@freezed
class MBaby with _$MBaby {
  const MBaby._();
  const factory MBaby({
    required String id,
    String? name,
    String? avatar,
    String? type,
    String? gender,
    DateTime? date,
    double? weight,
    double? height,
  }) = _MBaby;

  factory MBaby.empty() {
    return const MBaby(id: '');
  }

  factory MBaby.fromJson(Map<String, Object?> json) => _$MBabyFromJson(json);
}
