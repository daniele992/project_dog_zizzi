import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';

class PayTable extends ConsumerStatefulWidget {
  const PayTable({super.key});

  @override
  ConsumerState<PayTable> createState() => _PayTable();
}

class _PayTable extends ConsumerState<PayTable> {

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          //Title
          child: Text(
            tTitleTablePayment,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),

      ],
    );
  }
}
