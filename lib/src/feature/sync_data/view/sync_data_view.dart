import 'package:flutter/material.dart';
import 'package:safebump/gen/assets.gen.dart';

class SyncDataScreen extends StatelessWidget {
  const SyncDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Assets.jsons.syncData.lottie(),
    );
  }
}
