import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/base_class.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/loader/app_loader.dart';

class BuildBodyWLoader extends StatelessWidget with BasePage {
  final bool isLoading;
  final Widget body;

  const BuildBodyWLoader({
    super.key,
    required this.isLoading,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        body,
        if (isLoading)
          const Positioned.fill(
            child: AppLoader(),
          ),
      ],
    );
  }
}
