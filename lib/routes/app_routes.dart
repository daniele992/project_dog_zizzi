import 'package:flutter/cupertino.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signIn_view.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signUp_view.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';

  //Mappa delle route
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInPage(),
    register: (context) => const SignUpPage(),
  };
}