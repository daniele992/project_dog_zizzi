import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_dog_zizzi/data/models/listUsers_model.dart';
import 'package:project_dog_zizzi/ui/widgets/user_card.dart';


Widget buildResponsiveList(List<UserModel> users){
  return LayoutBuilder(
      builder: (context, constraints){
        final width = constraints.maxWidth;

        final crossAxisCount = width > 1100
            ? 3
            : width > 700
              ? 2
              : 1;

        return MasonryGridView.count(
            padding: const EdgeInsets.all(20),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            crossAxisCount: crossAxisCount,
            itemCount: users.length,
            itemBuilder: (_, index) {
              return UserCard(user: users[index]);
            }
        );
      }
  );
}