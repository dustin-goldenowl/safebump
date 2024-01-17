import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safebump/src/network/firebase/base_collection.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/common/result.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/services/user_prefs.dart';

class BabyReference extends BaseCollectionReference<MBaby> {
  BabyReference()
      : super(
          FirebaseFirestore.instance
              .collection(
                  'users/${(UserPrefs.I.getUser() ?? MUser.empty()).id}/baby')
              .withConverter<MBaby>(
                fromFirestore: (snapshot, options) =>
                    MBaby.fromJson(snapshot.data() as Map<String, dynamic>),
                toFirestore: (chatRoom, _) => chatRoom.toJson(),
              ),
          getObjectId: (e) => e.id,
          setObjectId: (e, id) => e.copyWith(id: id),
        );

  Future<MResult<MBaby>> getOrAddBaby(MBaby baby) async {
    try {
      final result = await get(baby.id);
      if (result.isError == false) {
        return result;
      } else {
        final MResult<MBaby> result = await set(baby);
        return MResult.success(result.data);
      }
    } catch (e) {
      return MResult.exception(e);
    }
  }

  Future<MResult<List<MBaby>>> getBabies() async {
    try {
      final QuerySnapshot<MBaby> query =
          await ref.get().timeout(const Duration(seconds: 10));
      final docs = query.docs.map((e) => e.data()).toList();
      return MResult.success(docs);
    } catch (e) {
      return MResult.exception(e);
    }
  }
}
