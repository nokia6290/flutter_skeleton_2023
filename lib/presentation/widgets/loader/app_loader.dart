import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/business/services/base_class.dart';

class AppLoader extends StatelessWidget with BasePage {
  const AppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getScreenSize(context).height,
      width: getScreenSize(context).width,
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
        ),
      ),
    );
  }
}
