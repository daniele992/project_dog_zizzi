import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/token/token_provider.dart';
import '../../../routes/app_routes.dart';

class LogoutService {

  static Future<void> performLogout({
    required BuildContext context,
    required WidgetRef ref,

  }) async {

    //Elimina Token
    await ref.read(logoutTokenProvider)();

    //Evita wanrning context async. mounted serve per verificare che il widget sia ancora presente nell'albero dei widget dopo un'operazione async
    if (!context.mounted) return;

    //Navigazione al login
    Navigator.pushNamedAndRemoveUntil(
        context,
        AppRoutes.login,
        (route) => false,
    );

  }
}