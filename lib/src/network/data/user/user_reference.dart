import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safebump/src/network/firebase/base_collection.dart';
import 'package:safebump/src/network/firebase/collection/collection.dart';
import 'package:safebump/src/network/model/common/result.dart';
import 'package:safebump/src/network/model/user/user.dart';

class UserReference extends BaseCollectionReference<MUser> {
  UserReference()
      : super(
          XCollection.user,
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MUser>> getOrAddUser(MUser user) async {
    try {
      final result = await get(user.id);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MUser> result = await set(user);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MUser>>> getUsers() async {
    try {
      final QuerySnapshot<MUser> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
