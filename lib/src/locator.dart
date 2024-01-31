import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/firebase_options.dart';
import 'package:safebump/src/config/device/app_info.dart';
import 'package:safebump/src/local/repo/notes/notes_local_repo.dart';
import 'package:safebump/src/local/repo/notes/notes_local_repo_impl.dart';
import 'package:safebump/src/network/data/articles/articles_repository.dart';
import 'package:safebump/src/network/data/articles/articles_repository_impl.dart';
import 'package:safebump/src/network/data/daily_quiz/daily_quiz_repository.dart';
import 'package:safebump/src/network/data/daily_quiz/daily_quiz_repository_impl.dart';
import 'package:safebump/src/local/database_app.dart';
import 'package:safebump/src/local/repo/baby_infor_local_repo.dart';
import 'package:safebump/src/local/repo/baby_infor_local_repo_impl.dart';
import 'package:safebump/src/network/data/baby/baby_repo.dart';
import 'package:safebump/src/network/data/baby/baby_repo_impl.dart';
import 'package:safebump/src/network/data/note/note_repository.dart';
import 'package:safebump/src/network/data/note/note_repository_impl.dart';
import 'package:safebump/src/network/data/quiz/quiz_repository.dart';
import 'package:safebump/src/network/data/quiz/quiz_repository_impl.dart';
import 'package:safebump/src/network/data/sign/sign_repository.dart';
import 'package:safebump/src/network/data/sign/sign_repository_impl.dart';
import 'package:safebump/src/network/data/user/user_repository.dart';
import 'package:safebump/src/network/data/user/user_repository_impl.dart';
import 'package:safebump/src/network/data/video/video_repository.dart';
import 'package:safebump/src/network/data/video/video_repository_impl.dart';
import 'package:safebump/src/router/router.dart';
import 'package:safebump/src/services/user_prefs.dart';

Future initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Future.wait([
    AppInfo.initialize(),
    UserPrefs.instance.initialize(),
  ]);
  _locator();
}

void _locator() {
  GetIt.I.registerLazySingleton(() => AppRouter());

  GetIt.I.registerLazySingleton<SignRepository>(() => SignRepositoryImpl());
  GetIt.I.registerLazySingleton<UserRepository>(() => UserRepositoryImpl());
  GetIt.I.registerLazySingleton<DailyQuizRepository>(
      () => DailyQuizRepositoryImpl());
  GetIt.I.registerLazySingleton<BabyRepository>(() => BabyRepositoryImpl());
  GetIt.I.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl());
  GetIt.I.registerLazySingleton<ArticlesRepository>(
      () => ArticlesRepositoryImpl());
  GetIt.I.registerLazySingleton<VideosRepository>(() => VideosRepositoryImpl());
  GetIt.I.registerLazySingleton<QuizRepository>(() => QuizRepositoryImpl());

  GetIt.I.registerLazySingleton<DatabaseApp>((() => DatabaseApp()));
  GetIt.I.registerLazySingleton<BabyInforLocalRepo>(
      () => BabyInforLocalRepoImpl(GetIt.I()));
  GetIt.I.registerLazySingleton<NotesLocalRepo>(
      () => NotesLocalRepoImpl(GetIt.I()));
}

void resetSingleton() {
  GetIt.I.resetLazySingleton<BabyRepository>();
  GetIt.I.resetLazySingleton<NoteRepository>();
}

void reRegisterSingleton() {
  GetIt.I.registerLazySingleton<BabyRepository>(() => BabyRepositoryImpl());
  GetIt.I.registerLazySingleton<NoteRepository>(() => NoteRepositoryImpl());
}
