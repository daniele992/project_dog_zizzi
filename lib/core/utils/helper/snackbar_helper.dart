import 'package:flutter/material.dart';

class SnackbarHelper {
  // Metodo statico per mostrare lo SnackBar
  static void showSnackBar(
      BuildContext context, {
        required String message,
        Color backgroundColor = Colors.red,
        required IconData icon,
        Duration duration = const Duration(seconds: 3),
      }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Expanded(child: Text(message)),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
        shape: const StadiumBorder(),
        margin: const EdgeInsets.all(16), // margine necessario per floating,
      ),
    );
  }
}

