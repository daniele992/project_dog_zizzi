import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showDeleteUser(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Conferma eliminazione'),
      content: const Text('Sei sicuro di voler eliminare questo elemento?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(), // Chiudi dialog senza fare nulla
          child: const Text('No'),
        ),
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