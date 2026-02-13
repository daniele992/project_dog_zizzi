import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/text_strings.dart';
import '../../../data/models/listUsers_model.dart';

void showDeleteUser(BuildContext context, UserModel user) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
          tConfirmDeletion,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: ${user.name}'),
          Text('Cognome: ${user.surname}'),
          Text('Email: ${user.email}'),
          const SizedBox(height: 10),
          const Text(tSecureDeleteUser),
        ],
      ),
      actions: [
        //Button non conferma
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Chiudi dialog senza fare nulla
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue, // Evidenzia delete
          ),
          child: const Text('No'),
        ),
        //Button di conferma
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Chiudi dialog; // Esegui delete
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Evidenzia delete
          ),
          child: const Text('Sì'),
        ),
      ],
    ),
  );
}