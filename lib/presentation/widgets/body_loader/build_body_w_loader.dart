import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/business/services/base_class.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/loader/app_loader.dart';

class BuildBodyWLoader extends StatelessWidget with BasePage {
  final bool isLoading;
  final Widget body;
  final bool isHorizontalPadding16;

  const BuildBodyWLoader({
    required this.isLoading,
    required this.body,
    this.isHorizontalPadding16 = false,
  });

  double isHorizontalPaddingRequired() {
    double paddingHorizontal;
    isHorizontalPadding16 ? paddingHorizontal = 16 : paddingHorizontal = 0;
    return paddingHorizontal;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isHorizontalPaddingRequired(),
      ),
      child: _buildBody(),
    );
  }

  Widget _buildBody() => Stack(
        children: <Widget>[
          body,
          if (isLoading)
            const Positioned.fill(
              child: AppLoader(),
            ),
        ],
      );
}
