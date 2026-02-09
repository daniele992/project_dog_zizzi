import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/image_strings.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/authRepository/user_provider.dart';

class HomepageAppbar extends ConsumerWidget implements PreferredSizeWidget {
  const HomepageAppbar({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userNameAsync = ref.watch(userFullNameProvider);
    final isAdminAsync = ref.watch(userIsAdminProvider);

    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          userNameAsync.when(
              loading: () => const Text("Caricamento..."),
              error: (_, __) => const Text(tProfile),
              data: (name) => Text(
                name ?? tProfile,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
          ),
          isAdminAsync.when(
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => const Text('Errore'),
              data: (isAdmin){ return Text(isAdmin ? 'Admin' : 'User');}
          )
        ],
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20, top: 7),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          child: IconButton(
              onPressed:(){},
              icon: const Image(image: AssetImage(tUserProfileImage)),
          ),
        )
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(55);
}