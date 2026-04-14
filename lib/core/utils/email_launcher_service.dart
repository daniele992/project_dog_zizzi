import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

//launch url di default usa platformDefault. Il browser tenta di aprire una nuova tab e se non trova un handler mail configurato --> pagina bianca
class EmailLauncherService {
  static Future<void> sendEmail(String email) async {
    if (kIsWeb) {
      //WEB -> Apri Gmail direttamente
      final Uri gmailUri = Uri.parse(
        'https://mail.google.com/mail/?view=cm&fs=1'
        '&to=$email'
        /*'&su=Nuovo Post Pubblicato'
        '&body=Ciao',*/
      );

      await launchUrl(
        gmailUri,
        mode: LaunchMode.externalApplication,
      );
    } else {
      //MOBILE -> Usa mailto
      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: email,
        /*queryParameters: {
          'subject': 'Nuovo Post Pubblicato',
          'body': 'Ciao',
        },*/
      );

      await launchUrl(
        emailUri,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}
