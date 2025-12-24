import 'package:flutter/cupertino.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signIn_view.dart';
import 'package:project_dog_zizzi/ui/views/authentication/signUp_view.dart';

import '../ui/views/homepage/home_page.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const homepage = '/homepage';

  //Mappa delle route
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInPage(),
    register: (context) => const SignUpPage(),
    homepage: (context) => const MyHomePage(),
  };
}