import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/filter/user_filter_provider.dart';
import 'package:project_dog_zizzi/core/providers/user/user_providers.dart';
import '../../core/constants/text_strings.dart';

Widget buildFilter(WidgetRef ref, bool? filter){
  return Center(
    child: DropdownButton<bool?>(
      value: filter,
      hint: const Text(tFilterUsers),
      items: const [
        DropdownMenuItem(value: null, child: Text(tAllUsers)),
        DropdownMenuItem(value: true, child: Text(tOnlyAdmin)),
        DropdownMenuItem(value: false, child: Text(tOnlyNoAdmin)),
      ],
      onChanged: (value) {
        ref.read(userAdminFilterProvider.notifier).state = value;
        ref.read(userViewModelProvider.notifier).fetchUsers(isAdmin: value);
      },
    ),
  );
}