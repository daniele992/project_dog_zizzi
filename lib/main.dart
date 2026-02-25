import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/presentation/views/splash_screen/splash_screen.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:project_dog_zizzi/routes/app_routes.dart';
import 'core/utils/themes/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: AppRoutes.routes,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        //Dalla versione 11, flutter_quill: non usa più tooltip hardcoded, usa sistema di localizzazione interno quindi richiede la registrazione altrimenti crash
        FlutterQuillLocalizations.delegate
      ],
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
