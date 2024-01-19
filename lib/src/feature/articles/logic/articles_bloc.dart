import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/dialogs/toast_wrapper.dart';
import 'package:safebump/src/feature/articles/logic/articles_state.dart';
import 'package:safebump/src/network/data/articles/articles_repository.dart';
import 'package:safebump/src/network/model/articles/articles.dart';
import 'package:safebump/src/utils/utils.dart';

class ArticlesBloc extends Cubit<ArticlesState> {
  ArticlesBloc() : super(ArticlesState());

  Future<void> inital(BuildContext context) async {
    _createLoadingScreen();
    await _getArticlesFromFirebase(context);
    _hideLoadingScreen();
  }

  void _createLoadingScreen() {
    emit(state.copyWith(status: ArticlesStatus.loading));
    XToast.showLoading();
  }

  void _hideLoadingScreen() {
    if (XToast.isShowLoading) {
      XToast.hideLoading();
    }
  }

  Future<void> _getArticlesFromFirebase(BuildContext context) async {
    try {
      final result = await GetIt.I.get<ArticlesRepository>().getAllArticles();
      if (result.data == null) {
        emit(state.copyWith(status: ArticlesStatus.fail));
        _hideLoadingScreen();
        return;
      }
      emit(state.copyWith(articles: result.data));
      await _getListAticleImages();
      _hideLoadingScreen();
    } catch (e) {
      xLog.e(e);
      emit(state.copyWith(status: ArticlesStatus.fail));
      _hideLoadingScreen();
    }
  }

  Future<void> _getListAticleImages() async {
    Map<String, Uint8List> listImage = {};
    for (MArticles article in state.articles ?? []) {
      try {
        final image =
            await GetIt.I.get<ArticlesRepository>().getArticleImage(article.id);
        if (image.data != null) {
          listImage.addEntries({article.id: image.data!}.entries);
        }
      } catch (e) {
        xLog.e(e);
      }
    }
    emit(state.copyWith(listImage: listImage));
  }
}
