import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/business/services/injection_container.dart'
    as di;
import 'package:flutter_skeleton_2023/data/data_store/configurations/flavor_config.dart';
import 'package:flutter_skeleton_2023/presentation/resources/theme_data_custom.dart';
import 'package:flutter_skeleton_2023/presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO add other flavors
  await di.initFlavorConfig(Flavor.dev);
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(useMaterial3: true),
      theme: ThemeData.dark(useMaterial3: true),
      // theme: ThemeDataCustom().themeData,
      home: const HomeScreen(),
    );
  }
}
