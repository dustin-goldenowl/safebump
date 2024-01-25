import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safebump/src/network/model/articles/articles.dart';
import 'package:safebump/src/network/model/baby/baby.dart';
import 'package:safebump/src/network/model/calendar/calendar.dart';
import 'package:safebump/src/network/model/daily_quiz.dart/daily_quiz.dart';
import 'package:safebump/src/network/model/user/user.dart';
import 'package:safebump/src/network/model/video/video.dart';
import 'package:safebump/src/services/user_prefs.dart';

class XCollection {
  static CollectionReference<MUser> get user =>
      FirebaseFirestore.instance.collection('users').withConverter<MUser>(
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

  static CollectionReference<MCalendar> get calendar =>
      FirebaseFirestore.instance
          .collection(
              'users/${(UserPrefs.I.getUser() ?? MUser.empty()).id}/calendar')
          .withConverter<MCalendar>(
            fromFirestore: (snapshot, options) =>
                MCalendar.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (chatRoom, _) => chatRoom.toJson(),
          );

  static CollectionReference<MArticles> get articles =>
      FirebaseFirestore.instance
          .collection('articles')
          .withConverter<MArticles>(
            fromFirestore: (snapshot, options) =>
                MArticles.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (chatRoom, _) => chatRoom.toJson(),
          );

  static CollectionReference<MVideo> get video =>
      FirebaseFirestore.instance
          .collection('videos')
          .withConverter<MVideo>(
            fromFirestore: (snapshot, options) =>
                MVideo.fromJson(snapshot.data() as Map<String, dynamic>),
            toFirestore: (chatRoom, _) => chatRoom.toJson(),
          );
}
