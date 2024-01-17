import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/daily_quiz.dart/daily_quiz.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/services/user_prefs.dart';

class XCollection {
  static CollectionReference<MUser> get user =>
      FirebaseFirestore.instance.collection('user').withConverter<MUser>(
            fromFirestore: (snapshot, options) =>
                MUser.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (chatRoom, _) => chatRoom.toJson(),
          );

  static CollectionReference<DailyQuiz> get dailyQuiz =>
      FirebaseFirestore.instance
          .collection('daily_quiz')
          .withConverter<DailyQuiz>(
            fromFirestore: (snapshot, options) =>
                DailyQuiz.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (chatRoom, _) => chatRoom.toJson(),
          );
  static CollectionReference<MBaby> get baby => FirebaseFirestore.instance
      .collection('users/${(UserPrefs.I.getUser() ?? MUser.empty()).id}/baby')
      .withConverter<MBaby>(
        fromFirestore: (snapshot, options) =>
            MBaby.fromJson(snapshot.data() as Map<String, dynamic>),
        toFirestore: (chatRoom, _) => chatRoom.toJson(),
      );
}
