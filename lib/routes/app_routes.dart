import 'package:flutter/cupertino.dart';
import '../features/auth/presentation/view/signIn_view.dart';
import '../features/auth/presentation/view/signUp_view.dart';
import '../features/auth/presentation/view/conditions.dart';
import '../features/homepage/presentation/view/home_page.dart';
import '../features/auth/presentation/view/privacy.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const homepage = '/homepage';
  static const acceptPrivacy = '/privacy';
  static const acceptConditions = '/conditions';

  //Mappa delle route
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInPage(),
    register: (context) => const SignUpPage(),
    homepage: (context) => const MyHomePage(),
    acceptPrivacy: (context) => const PrivacyPolicyWidget(),
    acceptConditions: (context) => const TermsOfUseWidget(),
  };
}