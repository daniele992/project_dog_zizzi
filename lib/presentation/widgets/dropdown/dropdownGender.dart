import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/providers/addDog/dropdown_add_dog_provider.dart';
import '../../../data/models/dog_gender_model.dart';

class DropDownGender extends ConsumerWidget{
  const DropDownGender({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){

    final asyncGenderDog = ref.watch(genderProvider);
    final selectedGenderDog = ref.watch(genderSelectedProvider);

    return asyncGenderDog.when(
        loading: () => const CircularProgressIndicator(),
        error: (e, _) => Text("Errore: $e") ,
        data: (genderList){
          return DropdownButtonFormField<GenderDog>(
            isExpanded: true,
            decoration: const InputDecoration(labelText: tGenderDog),
            initialValue: selectedGenderDog,
            hint: const Text(tSelectedGender),
            onChanged: (val){
              ref.read(genderSelectedProvider.notifier).state = val;
            },
            items: genderList.map((gender){
              return DropdownMenuItem<GenderDog>(
                value: gender,
                child: Text(gender.name),
              );
            }).toList(),
            validator: (value){
              if(value == null) return 'seleziona un genere valido';
              return null;
            },
          );
        }
    );
  }
}

//submit dal botton
/* onPressed: () {
  if (_formKey.currentState!.validate()) {
    ref.read(addDogViewModelProvider.notifier).submitDog(model);
  }
}*/