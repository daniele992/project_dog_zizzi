import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/routes/app_routes.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signIn_view.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signUp_view.dart';
import 'package:project_dog_zizzi/ui/views/splash_screen/splash_screen.dart';
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
      darkTheme: TAppTheme.darkTheme,
      theme: TAppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}
