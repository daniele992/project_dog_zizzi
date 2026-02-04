import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constants/text_strings.dart';

Widget buildLoading(){
  return const Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        SizedBox(height: 12),
        Text(tLoadingUsers),
      ],
    ),
  );
}