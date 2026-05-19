import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/features/dog/presentation/view/dog_detail_page.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/providers/authRepository/user_provider.dart';
import '../../../../core/providers/dog/dog_providers.dart';
import '../../../../core/utils/Image/build_image_utils.dart';
import '../widgets/dog_custom_label_text.dart';

class ListDogs extends ConsumerStatefulWidget {

  final int userId;

  const ListDogs({
    super.key,
    required this.userId,
  });

  @override
  ConsumerState<ListDogs> createState() => _ListDogs();
}

class _ListDogs extends ConsumerState<ListDogs> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final isAdmin = ref.read(userIsAdminProvider).value;
      if (isAdmin != null) {
        ref.read(dogListViewModelProvider.notifier).fetchDogs(userId: widget.userId, isAdmin: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isAdmin = ref.watch(userIsAdminProvider).value;
    final dogsState = ref.watch(dogListViewModelProvider);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: dogsState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Errore: $e")),
        data: (dogs) {
          return ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              final dog = dogs[index];
              return Card(
                child: ListTile(
                  leading: dog.imageUrl != null
                     ? Hero(
                      tag: dog.imageUrl ?? dog.id.toString(),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            buildImageUrl(dog.imageUrl)
                        ),
                      ),
                  )
                  : const CircleAvatar(child: Icon(Icons.pets)),
                  title: Text(
                    dog.name.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      DogCustomLabelText(label: tBreedDog, value: dog.breed),
                      const SizedBox(height: 2),
                      DogCustomLabelText(label: tAgeDog, value: "${dog.age.toString()} anni"),
                      const SizedBox(height: 2),
                      DogCustomLabelText(label: tGenderDog, value: dog.gender),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                        Icons.arrow_forward_ios,
                    ),
                    color: Colors.blueAccent,
                    tooltip: "Dettaglio amico a quattro zampe",
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.resolveWith<Color>(
                          (states) {
                            if(states.contains(WidgetState.hovered)){
                              return Colors.white;
                            }
                            return Colors.blueAccent;
                          },
                      ),
                      overlayColor: WidgetStateProperty.all(
                        Colors.green.withValues(alpha: 0.8),
                      )
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DogDetailPage(dog: dog),
                          ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
