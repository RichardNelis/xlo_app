import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_app/stores/connectivity_store.dart';
import 'package:xlo_app/stores/user_manager_store.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screen/base/base_screen.dart';
import 'stores/category_store.dart';
import 'stores/favorite_store.dart';
import 'stores/home_store.dart';
import 'stores/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _enablePlatformOverrideForDesktop();
  await initializeParse();
  setupLocators();
  runApp(const MyApp());
}

Future<void> initializeParse() async {
  await Parse().initialize(
    'Rnxoy6GfUeB58LcPmPdNANlpRYtpmaHcrVBOUZBb',
    'https://parseapi.back4app.com/',
    clientKey: 'SSnfmqy9idjaACmSj6p0pLdWaMayIUN9VS7agJpW',
    autoSendSessionId: true,
    debug: false,
  );
}

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void setupLocators() {
  GetIt.I.registerSingleton(ConnectivityStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(CategoryStore());
  GetIt.I.registerSingleton(FavoriteStore());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "XLO APP",
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme().copyWith(
          color: Colors.purple,
          elevation: 0,
        ),
        cardTheme: CardTheme(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.white,
            ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.purple,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle: TextStyle(
            color: Colors.purple,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
          ),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all<MaterialColor>(Colors.purple),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(0.0),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.orange.withAlpha(120);
                } else {
                  return Colors.orange;
                }
              },
            ),
          ),
        ),
        tabBarTheme: const TabBarTheme(
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.orange),
          ),
        ),
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: const BaseScreen(),
    );
  }
}
