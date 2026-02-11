import 'package:flutter/material.dart';

class TermsOfUseWidget extends StatelessWidget {
  const TermsOfUseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    double baseFontSize = screenWidth * 0.015;
    double headerFontSize = screenWidth * 0.020;

    Widget sectionHeader(IconData icon, String title) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: headerFontSize,
                  color: Colors.green),
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
      appBar: AppBar(title: const Text('Condizioni di Uso')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(Icons.description, 'Condizioni di Uso – App [Nome App]'),
            const SizedBox(height: 12),
            Text(
              'Benvenuto in [Nome App]. Utilizzando questa app accetti di rispettare le seguenti condizioni di utilizzo. Ti invitiamo a leggere attentamente.',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            const SizedBox(height: 20),

            sectionHeader(Icons.account_circle, '1. Creazione e gestione dell’account'),
            const SizedBox(height: 8),
            bulletPoint('L’utente è responsabile della correttezza dei dati forniti al momento della registrazione.'),
            bulletPoint('L’utente deve mantenere segrete le credenziali di accesso.'),
            bulletPoint('In caso di sospetta violazione dell’account, contattare immediatamente il supporto.'),
            const SizedBox(height: 16),

            sectionHeader(Icons.security, '2. Password e sicurezza'),
            const SizedBox(height: 8),
            bulletPoint('Le password sono salvate in forma criptata.'),
            bulletPoint('Facciamo tutto il possibile per proteggere i dati, ma non possiamo garantire sicurezza totale.'),
            bulletPoint('L’utente è responsabile della scelta di password sicure e della loro custodia.'),
            const SizedBox(height: 16),

            sectionHeader(Icons.content_copy, '3. Uso consentito dell’app'),
            const SizedBox(height: 8),
            bulletPoint('L’utente si impegna a utilizzare l’app solo per scopi leciti e autorizzati.'),
            bulletPoint('È vietato distribuire contenuti dannosi, illegali o offensivi.'),
            bulletPoint('Non è consentito tentare di compromettere la sicurezza dell’app.'),
            const SizedBox(height: 16),

            sectionHeader(Icons.warning, '4. Limitazioni di responsabilità'),
            const SizedBox(height: 8),
            bulletPoint('L’app è fornita “così com’è” senza garanzie implicite o esplicite.'),
            bulletPoint('Non ci assumiamo responsabilità per perdite di dati o danni derivanti dall’uso dell’app.'),
            bulletPoint('L’utente accetta di usare l’app a proprio rischio.'),
            const SizedBox(height: 16),

            sectionHeader(Icons.update, '5. Modifiche alle condizioni'),
            const SizedBox(height: 8),
            bulletPoint('Ci riserviamo il diritto di aggiornare le condizioni di uso.'),
            bulletPoint('Gli aggiornamenti saranno comunicati tramite l’app o email.'),
            const SizedBox(height: 16),

            sectionHeader(Icons.contact_mail, '6. Contatti'),
            const SizedBox(height: 8),
            Text(
              'Per domande relative alle condizioni di uso, contatta:',
              style: TextStyle(fontSize: baseFontSize, height: 1.5),
            ),
            Text(
              'Email: support@[nomeapp].com',
              style: TextStyle(fontSize: baseFontSize, height: 1.5, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}