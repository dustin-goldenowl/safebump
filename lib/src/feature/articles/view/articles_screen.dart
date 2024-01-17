import 'package:flutter/material.dart';
import 'package:safebump/src/localization/localization_utils.dart';
import 'package:safebump/src/router/coordinator.dart';
import 'package:safebump/widget/appbar/appbar_dashboard.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _renderAppBar(context),
        ],
      )),
    );
  }

  Widget _renderAppBar(BuildContext context) {
    return XAppBarDashboard(
      title: S.of(context).articles,
      leading: IconButton(
        onPressed: () {
          AppCoordinator.pop();
        },
        icon: const Icon(Icons.arrow_back),
      ),
      isTitleCenter: true,
      action: IconButton(
          onPressed: () {
            // Todo: Add event
          },
          icon: const Icon(Icons.more_vert_rounded)),
    );
  }
}
