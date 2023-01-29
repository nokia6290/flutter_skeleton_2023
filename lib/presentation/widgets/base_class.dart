import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/presentation/widgets/app_dialogs/app_dialogs.dart';

mixin BasePage {
  dismissKeyboard(context) {
    FocusScope.of(context).unfocus();
  }

  void onErrorShowErrorDialog(context, state) {
    AppDialogs.showSimpleDialog(
      context: context,
      errorTitle: state.error.title,
      errorMessage: state.error.description,
    );
  }

  Size getScreenSize(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return screenSize;
  }

  double getScreenHeightWSafeArea(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    final double topBar = AppBar().preferredSize.height;
    final double height2 =
        getScreenSize(context).height - topPadding - bottomPadding - topBar;
    return height2;
  }
}
