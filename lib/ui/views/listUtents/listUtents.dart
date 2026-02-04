import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/providers/filter/user_filter_provider.dart';
import 'package:project_dog_zizzi/core/providers/user/user_providers.dart';
import 'package:project_dog_zizzi/ui/widgets/build_loading.dart';
import 'package:project_dog_zizzi/ui/widgets/responsive_grid.dart';
import '../../widgets/build_Filter.dart';

class ListUsers extends ConsumerStatefulWidget {
  const ListUsers({super.key});

  @override
  ConsumerState<ListUsers> createState() => _ListUsers();
}

class _ListUsers extends ConsumerState<ListUsers> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(userViewModelProvider.notifier).fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {

    final userAsync = ref.watch(userViewModelProvider);
    final adminFilter = ref.watch(userAdminFilterProvider);

    return Column(
      children: [
        const SizedBox(height: 16),

        //FILTRO
        buildFilter(ref, adminFilter),

        const SizedBox(height: 16),

        //LISTA
        Expanded(
            child: userAsync.when(
                loading: buildLoading,
                error: (e,_) => Center(child:Text(e.toString())),
                data: buildResponsiveList,
            ),
        ),
      ],
    );
  }
}
