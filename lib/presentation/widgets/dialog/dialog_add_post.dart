import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';
import 'package:project_dog_zizzi/core/utils/validators/form_add_dog_validators.dart';

import '../../../core/providers/addPost/dropdown_add_post_provider.dart';
import '../dropdown/dropdown_form_field_dog.dart';

class ShowDialogAddPost extends ConsumerStatefulWidget {
  const ShowDialogAddPost({super.key});

  @override
  ConsumerState<ShowDialogAddPost> createState() => _ShowDialogAddPost();
}

class _ShowDialogAddPost extends ConsumerState<ShowDialogAddPost> {

  final _formKey = GlobalKey<FormState>();

  final titlePost = TextEditingController();
  final categoryPost = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsetsGeometry.only(
            bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  tTitleAddPost,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 16), //Space

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // --------------- INDISPENSABILI ---------------
                      ExpansionTile(
                          title: const Text(
                            tTitleEssential,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        leading: const Icon(
                          Icons.badge_outlined,
                          color: Colors.blue,
                        ),
                        iconColor: Colors.red,
                        children: [
                          const SizedBox(height: 6),
                          //Titolo Post
                          TextFormField(
                            controller: titlePost,
                            decoration: const InputDecoration(
                              labelText: tTitlePost,
                            ),
                            validator: FormDogValidator.validateNameDog,
                          ),
                          const SizedBox(height: 12),

                          //Categoria
                          DropDownFormFieldDog(
                            asyncProvider: ref.watch(categoryPostProvider), // AsyncValue<List<GenderDog>>
                            selectedProvider: categorySelectedProvider, // StateProvider<GenderDog?>
                            labelText: tGenderDog,
                            hintText: tSelectedGender,
                            getItemLabel: (category) => category.name ?? '',
                            validator: (value) => value == null
                                ? 'Seleziona una categoria valida'
                                : null,
                          ),
                          const SizedBox(height: 12),

                          TextFormField(
                            controller: titlePost,
                            decoration: const InputDecoration(
                              labelText: tTitlePost,
                            ),
                            validator: FormDogValidator.validateNameDog,
                          ),
                          const SizedBox(height: 12),

                        ],
                      ),

                      const SizedBox(height: 16),

                      /*ExpansionTile(

                      ),*/

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
