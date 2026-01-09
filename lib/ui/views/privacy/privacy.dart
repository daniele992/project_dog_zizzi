import 'package:flutter/material.dart';

class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double baseFontSize = screenWidth * 0.015;
    double headerFontSize = screenWidth * 0.020;

    Widget sectionHeader(IconData icon, String title) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: headerFontSize,
                  color: Colors.blueAccent),
            ),
          ),
        ],
      );
    }

    Widget bulletPoint(String text) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('• ', style: TextStyle(fontSize: baseFontSize)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(Icons.privacy_tip, 'Privacy Policy – App [Nome App]'),
            const SizedBox(height: 12),
            Text(
              'Benvenuto in [Nome App]. La tua privacy è importante per noi. Leggi attentamente le condizioni seguenti per comprendere come raccogliamo, utilizziamo e proteggiamo i tuoi dati.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 20),

            sectionHeader(Icons.data_usage, '1. Raccolta dei dati'),
            const SizedBox(height: 8),
            bulletPoint('Informazioni di accesso (username e password)'),
            bulletPoint('Dati generali relativi all’uso dell’app'),
            bulletPoint('Non raccogliamo informazioni personali sensibili senza il tuo consenso'),
            const SizedBox(height: 16),

            sectionHeader(Icons.settings, '2. Uso dei dati'),
            const SizedBox(height: 8),
            bulletPoint('Gestire l’account e l’autenticazione'),
            bulletPoint('Migliorare l’esperienza dell’utente'),
            bulletPoint('Fornire notifiche e aggiornamenti'),
            const SizedBox(height: 16),

            sectionHeader(Icons.security, '3. Protezione dei dati'),
            const SizedBox(height: 8),
            Text(
              'Le tue informazioni sono trattate con la massima cura. Adottiamo misure tecniche e organizzative per proteggerle da accessi non autorizzati.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 8),
            sectionHeader(Icons.vpn_key, '🔐 Password'),
            const SizedBox(height: 4),
            Text(
              'Le password vengono salvate in forma criptata. Facciamo tutto il possibile per impedire accessi non autorizzati o furti di dati, ma non possiamo assumerci responsabilità per eventuali violazioni esterne. Ti invitiamo a scegliere password sicure e a non condividerle con altri.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 16),

            sectionHeader(Icons.share, '4. Condivisione dei dati'),
            const SizedBox(height: 8),
            Text(
              'Non condividiamo i tuoi dati personali con terze parti senza il tuo consenso, salvo obblighi di legge.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 16),

            sectionHeader(Icons.edit, '5. Modifiche alla privacy policy'),
            const SizedBox(height: 8),
            Text(
              'Ci riserviamo il diritto di aggiornare questa privacy policy. Ti consigliamo di consultarla periodicamente.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 16),

            sectionHeader(Icons.contact_mail, '6. Contatti'),
            const SizedBox(height: 8),
            Text(
              'Per domande relative alla privacy, contatta:',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            Text(
              'Email: privacy@[nomeapp].com',
              style: TextStyle(fontSize: baseFontSize, height: 1.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}