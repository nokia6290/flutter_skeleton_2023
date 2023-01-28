import 'package:flutter/material.dart';
import 'package:flutter_skeleton_2023/data/data_store/dependency_injection.dart'
    as di;
import 'package:flutter_skeleton_2023/data/data_store/configurations/flavor_config.dart';
import 'package:flutter_skeleton_2023/presentation/screens/home/home_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO add other flavors
  await di.initFlavorConfig(Flavor.dev);
  await di.initDependencyInjector();
  await SentryFlutter.init(
    (SentryFlutterOptions options) {
      options.addIntegration(LoggingIntegration());
      options.reportPackages = false;
      options.enableOutOfMemoryTracking = true;
      options.enableAppLifecycleBreadcrumbs = false;
      options.anrEnabled = true;
      options.debug = false;
      //TODO add sentry link
      options.dsn =
          'https://24304362cdd445babeb01dad113d9104@o1087560.ingest.sentry.io/4504580733665280';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeScreen(),
    );
  }
}
