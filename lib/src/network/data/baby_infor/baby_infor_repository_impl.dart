import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/local/repo/baby_infor_fact/baby_infor_fact_local_repo.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/network/data/baby_infor/baby_infor_repository.dart';
import 'package:safebump/src/network/data/baby_infor/baby_infor_storage_reference.dart';
import 'package:safebump/src/network/data/baby_infor/baby_infor_reference.dart';
import 'package:safebump/src/network/model/baby_infor/baby_infor.dart';
import 'package:safebump/src/network/model/common/result.dart';

class BabyInforRepositoryImpl extends BabyInforRepository {
  final babyInforRef = BabyInforReference();
  final babyInforStorageRef = BabyInforStorageReference();
  @override
  Future<MResult<List<MBabyInfor>>> getAllBabyInfor() async {
    final result = await babyInforRef.getAllBabyInfor();
    if (result.data != null) {
      for (MBabyInfor babyInfor in result.data!) {
        final babyDataEntity = [babyInfor].convertToEntityData().first;
        await GetIt.I.get<BabyInforFactLocalRepo>().upsert(babyDataEntity);
      }
      return result;
    }
    return MResult.error(S.text.someThingWentWrong);
  }

  @override
  Future<MResult<List>> getAllBabyInforImage() async {
    return await babyInforStorageRef.getAllBabyInforImage();
  }

  @override
  Future<MResult<Uint8List>> getBabyInforImage(String id) async {
    return await babyInforStorageRef.getBabyInforImage(id);
  }

  @override
  Future<MResult<MBabyInfor>> getBabyInfor(String id) async {
    return await babyInforRef.getBabyInforById(id);
  }
}
