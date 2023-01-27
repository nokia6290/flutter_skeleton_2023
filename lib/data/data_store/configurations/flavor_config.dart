import 'dart:async';
import 'dart:convert';

import 'package:flutter_skeleton_2023/data/data_store/configurations/asset_bundler.dart';

class Flavor {
  final String _name;

  const Flavor._internal(this._name);

  String get name => _name;

  static const Flavor dev = Flavor._internal("dev");
  // static const Flavor prod = Flavor._internal("prod");
  // static const Flavor uat = Flavor._internal("uat");
}

//TODO configure properly
class FlavorConfig {
  Map<String, dynamic> _config = {};

  Future<void> initialize(AssetBundler assetBundle, Flavor flavor) async {
    final String configString = await assetBundle
        .loadString('assets/environments/${flavor.name}/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  String get backendApiRootUrl => _config["baseUrl"];
}
