import 'package:boilerplate/core/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'flavors.dart';
import 'my_app.dart';

Future<void> mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (F.appFlavor == Flavor.STAGING) {
    await dotenv.load(
      fileName: '.staging.env',
    );
  } else {
    await dotenv.load(
      fileName: '.production.env',
    );
  }
  await initializeDependencies();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const App());
}
