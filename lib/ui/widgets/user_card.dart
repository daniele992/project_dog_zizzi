import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/models/listUsers_model.dart';
import 'admin_badge.dart';

class UserCard extends StatelessWidget {
  final UserModel user;

  const UserCard({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, //Evita Overflow
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${user.name} ${user.surname}',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AdminBadge(isAdmin: user.admin),
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {}, // solo UI per ora
                ),
              ],
            ),

            const SizedBox(height: 12),

            // EMAIL
            Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 8),

            // DATA CREAZIONE
            Text(
              'Creato il: ${user.createdAt.toLocal().toString().split(" ")[0]}',
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 8),

            // TERMINI ACCETTATI
            Text(
                'Termini Accettati: ${user.acceptTerms ? 'Si' : 'No'}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),

            ),

            const SizedBox(height: 8),

            // CONDIZIONI ACCETTATE
            Text(
                'Condizioni Accettate: ${user.acceptPrivacy ? 'Si' : 'No'}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey
                ),
            ),

            //ICONA PER MOSTRARE INFORMAZIONI AGGIUNTIVE, IN QUESTO CASO I CANI
            Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  color: Colors.blue,
                  iconSize: 36,
                  icon: const Icon(Icons.add_circle),
                  onPressed: (){},
              ),
            )

          ],
        ),
      ),
    );
  }
}
