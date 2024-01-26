import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:safebump/src/dialogs/toast_wrapper.dart';
import 'package:safebump/src/feature/articles/logic/article_detail_state.dart';
import 'package:safebump/src/network/data/articles/articles_repository.dart';
import 'package:safebump/src/utils/utils.dart';

class ArticleDetailBloc extends Cubit<ArticleDetailState> {
  ArticleDetailBloc({required String id}) : super(ArticleDetailState(id: id));

  Future<void> inital(BuildContext context) async {
    _createLoadingScreen();
    await _getDetailArticle();
    _hideLoadingScreen();
  }

  void _createLoadingScreen() {
    emit(state.copyWith(status: ArticleDetailStatus.loading));
    XToast.showLoading();
  }

  void _hideLoadingScreen() {
    if (XToast.isShowLoading) {
      XToast.hideLoading();
    }
  }

  Future<void> _getDetailArticle() async {
    try {
      final result =
          await GetIt.I.get<ArticlesRepository>().getArticle(state.id);
      if (result.data == null) {
        emit(state.copyWith(status: ArticleDetailStatus.fail));
        _hideLoadingScreen();
        return;
      }
      emit(state.copyWith(article: result.data));
      await _getArticleImage();
      _hideLoadingScreen();
    } catch (e) {
      emit(state.copyWith(status: ArticleDetailStatus.fail));
      xLog.e(e);
    }
  }

  Future<void> _getArticleImage() async {
    try {
      final result =
          await GetIt.I.get<ArticlesRepository>().getArticleImage(state.id);
      if (result.data == null) {
        emit(state.copyWith(status: ArticleDetailStatus.fail));
        return;
      }
      emit(state.copyWith(
          image: result.data, status: ArticleDetailStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ArticleDetailStatus.fail));
      xLog.e(e);
    }
  }
}
