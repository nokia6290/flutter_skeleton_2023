import 'dart:async';
import 'package:flutter/services.dart';

class AssetBundler {
  Future<String> loadString(
    String key,
  ) async {
    return rootBundle.loadString(key);
  }
}
