import 'package:equatable/equatable.dart';
import 'package:safebump/src/network/model/user/user.dart';

enum ProfileScreenStatus { init, loading, fail, success }

class ProfileState with EquatableMixin {
  ProfileState({required this.user, this.status = ProfileScreenStatus.init});

  final MUser user;
  final ProfileScreenStatus status;

  ProfileState copyWith({MUser? user, ProfileScreenStatus? status}) {
    return ProfileState(user: user ?? this.user, status: status ?? this.status);
  }

  @override
  List<Object?> get props => [user, status];
}
