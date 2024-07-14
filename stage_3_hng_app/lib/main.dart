import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stage_3_hng_app/app/app.bottomsheets.dart';
import 'package:stage_3_hng_app/app/app.dialogs.dart';
import 'package:stage_3_hng_app/app/app.locator.dart';
import 'package:stage_3_hng_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Roboto Flex',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.17,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Roboto Flex',
            fontSize: 19,
            fontWeight: FontWeight.w500,
            height: 1.17,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Roboto Flex',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.17,
          ),
          labelSmall: TextStyle(
            fontFamily: 'Roboto Flex',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            height: 1.17,
          ),
        ),
      ),
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
