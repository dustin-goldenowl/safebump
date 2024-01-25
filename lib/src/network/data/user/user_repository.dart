import 'package:safebump/src/network/model/common/result.dart';
import 'package:safebump/src/network/model/user/user.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser();
  Future<MResult<MUser>> getOrAddUser(MUser user);
  Future<MResult<List<MUser>>> getUsers();

  Future<MResult<bool>> upsertUser(MUser user);
  Future<MResult<bool>> deleteUser(MUser user);
}
