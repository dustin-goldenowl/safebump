import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safebump/gen/assets.gen.dart';
import 'package:safebump/gen/fonts.gen.dart';
import 'package:safebump/src/dialogs/toast_wrapper.dart';
import 'package:safebump/src/feature/articles/logic/article_detail_bloc.dart';
import 'package:safebump/src/feature/articles/logic/article_detail_state.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/src/theme/colors.dart';
import 'package:safebump/src/theme/value.dart';
import 'package:safebump/src/utils/padding_utils.dart';
import 'package:safebump/src/utils/utils.dart';
import 'package:safebump/widget/button/fill_button.dart';

class ArticlesDetailScreen extends StatefulWidget {
  const ArticlesDetailScreen({super.key});

  @override
  State<ArticlesDetailScreen> createState() => _ArticlesDetailScreenState();
}

class _ArticlesDetailScreenState extends State<ArticlesDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ArticleDetailBloc>().inital(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case ArticleDetailStatus.fail:
              XToast.error(S.of(context).tryAgain);
              return _renderFailFetchArticle();
            case ArticleDetailStatus.success:
              return _renderArticle();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _renderArticle() {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: _renderSliverAppBar(),
            stretchModes: const [StretchMode.zoomBackground],
            title: _renderTitle(),
          ),
          pinned: true,
          expandedHeight: 200,
          stretch: true,
          elevation: 0,
          centerTitle: true,
        ),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p15),
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppRadius.r10),
                  topRight: Radius.circular(AppRadius.r10)),
            ),
            child: DefaultTextStyle(
              style: const TextStyle(fontFamily: FontFamily.abel),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _renderTitleArticle(),
                  XPaddingUtils.verticalPadding(height: AppPadding.p20),
                  _renderContentArticle(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _renderSliverAppBar() {
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
        builder: (context, state) => isNullOrEmpty(state.image)
            ? const SizedBox.shrink()
            : Image.memory(
                state.image!,
                fit: BoxFit.cover,
              ));
  }

  Widget _renderTitle() {
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      buildWhen: (previous, current) => previous.article != current.article,
      builder: (context, state) {
        return Text(
          state.article?.title ?? "",
          style: const TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.inter,
              letterSpacing: 2,
              fontSize: AppFontSize.f20,
              fontWeight: FontWeight.w700),
        );
      },
    );
  }

  Widget _renderTitleArticle() {
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      buildWhen: (previous, current) => previous.article != current.article,
      builder: (context, state) {
        return Text(
          state.article?.title ?? '',
          style: const TextStyle(
              color: AppColors.primary,
              fontSize: AppFontSize.f30,
              fontWeight: FontWeight.bold),
        );
      },
    );
  }

  Widget _renderContentArticle() {
    return BlocBuilder<ArticleDetailBloc, ArticleDetailState>(
      buildWhen: (previous, current) => previous.article != current.article,
      builder: (context, state) {
        return Text(
          state.article?.content ?? '',
          style: const TextStyle(
            color: AppColors.black,
            fontSize: AppFontSize.f16,
          ),
        );
      },
    );
  }

  Widget _renderFailFetchArticle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.svg.emptyIllustratiom.svg(),
          Text(
            S.of(context).someThingWentWrong,
            style: const TextStyle(
                fontFamily: FontFamily.abel,
                fontSize: AppFontSize.f20,
                color: AppColors.black),
          ),
          XPaddingUtils.verticalPadding(height: AppPadding.p16),
          XFillButton(
              onPressed: () => AppCoordinator.pop(),
              label: Text(
                S.of(context).back,
                style: const TextStyle(
                  fontFamily: FontFamily.productSans,
                  fontWeight: FontWeight.bold,
                  fontSize: AppFontSize.f20,
                  color: AppColors.white,
                ),
              )),
          XPaddingUtils.verticalPadding(height: AppPadding.p45),
        ],
      ),
    );
  }
}
