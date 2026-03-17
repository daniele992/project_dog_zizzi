import 'package:flutter/cupertino.dart'; //Widget di cupertino stile IOS
import '../features/auth/presentation/view/signIn_view.dart';
import '../features/auth/presentation/view/signUp_view.dart';
import '../features/auth/presentation/view/conditions.dart';
import '../features/dog/presentation/view/list_dog_view.dart';
import '../features/homepage/presentation/view/home_page.dart';
import '../features/auth/presentation/view/privacy.dart';

///Classe che serve per centralizzare tutte le route dell'app in un unico file
class AppRoutes {
  static const login = '/login'; ////Identificatore della pagina
  static const register = '/register';
  static const homepage = '/homepage';
  static const acceptPrivacy = '/privacy';
  static const acceptConditions = '/conditions';
  static const listDogs = '/listDogs';

  //Creazione mappa delle route (Struttura chiave -> valore) in questo caso (String -> WidgetBuilder) quindi (nome route -> pagina da aprire)
  static Map<String, WidgetBuilder> routes = {
    login: (context) => const SignInPage(), //Collegamento route -> pagina
    register: (context) => const SignUpPage(),
    homepage: (context) => const MyHomePage(),
    acceptPrivacy: (context) => const PrivacyPolicyWidget(),
    acceptConditions: (context) => const TermsOfUseWidget(),
    listDogs: (context) => const ListDogs(),
  };
}