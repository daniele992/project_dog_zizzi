import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';

import '../../core/utils/validators/form_add_dog_validators.dart';
import 'dropdownGender.dart';

class ShowDialogAddDog extends ConsumerStatefulWidget {
  const ShowDialogAddDog({super.key});

  @override
  ConsumerState<ShowDialogAddDog> createState() => _ShowDialogAddDog();
}

class _ShowDialogAddDog extends ConsumerState<ShowDialogAddDog> {
  final _formKey = GlobalKey<FormState>();

  //Variables Registry
  final nameDog = TextEditingController();
  final ageDog = TextEditingController();
  final genderDog = TextEditingController();
  final breedDog = TextEditingController();

  //Variables Health
  final allergyDog = TextEditingController();
  final foodIntolerancesDog = TextEditingController();
  final typeFoodDog = TextEditingController();
  final pathologiesDog = TextEditingController();
  final notesHealth = TextEditingController();

  //Variables Behavioral
  final socializationDog = TextEditingController();
  final fearsOrPhobias = TextEditingController();
  final energyLevel = TextEditingController();
  final notesBehavioral = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        constraints: const BoxConstraints(maxWidth: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              tAddDog,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16), //Space

            Form(
              key: _formKey,
              child: Column(
                children: [
                  // --------------------- ANAGRAFICA ---------------------
                  ExpansionTile(
                    title: const Text(
                        tTitleRegistry,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    subtitle: const Text(
                        tSubTitleRegistry,
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                    ),
                    leading: const Icon(
                      Icons.badge_outlined,
                      color: Colors.blue,
                    ),
                    iconColor: Colors.red,
                    children: [

                      const SizedBox(height: 6),
                      //Nome
                      TextFormField(
                        controller: nameDog,
                        decoration: const InputDecoration(
                          labelText: tName,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateNameDog,
                      ),
                      const SizedBox(height: 12),

                      //Anni
                      TextFormField(
                        controller: ageDog,
                        decoration: const InputDecoration(
                          labelText: tAgeDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateAgeDog,
                      ),
                      const SizedBox(height: 12),

                      //Genere
                      /*TextFormField(
                        controller: genderDog,
                        decoration: const InputDecoration(
                          labelText: tGenderDog,
                          border: OutlineInputBorder(),
                        ),
                      ), */

                      const DropDownGender(),

                      const SizedBox(height: 12),

                      //Razza
                      TextFormField(
                        controller: breedDog,
                        decoration: const InputDecoration(
                          labelText: tBreedDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateBreed,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // --------------------- SALUTE E ALIMENTAZIONE ---------------------
                  ExpansionTile(
                    title: const Text(
                        tTitleHealth,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    subtitle: const Text(
                        tSubTitleHealth,
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                    ),
                    leading: const Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.blue,
                    ),
                    iconColor: Colors.red,
                    children: [
                      const SizedBox(height: 6),
                      //Allergie
                      TextFormField(
                        controller: allergyDog,
                        decoration: const InputDecoration(
                          labelText: tAllergyDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateNameDog,
                      ),
                      const SizedBox(height: 12),

                      //Tipo di cibo
                      TextFormField(
                        controller: typeFoodDog,
                        decoration: const InputDecoration(
                          labelText: tTypeFoodDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateAgeDog,
                      ),
                      const SizedBox(height: 12),

                      //Intolleranze
                      TextFormField(
                        controller: foodIntolerancesDog,
                        decoration: const InputDecoration(
                          labelText: tFoodIntolerancesDog,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      //Patologie
                      TextFormField(
                        controller: pathologiesDog,
                        decoration: const InputDecoration(
                          labelText: tPathologiesDog,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      //Notes Health
                      TextFormField(
                        controller: notesHealth,
                        decoration: const InputDecoration(
                          labelText: tNoteHealthDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateBreed,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // --------------------- COMPORTAMENTO ---------------------
                  ExpansionTile(
                    title: const Text(
                        tBehavior,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                    subtitle: const Text(
                        tSubTitleBehavioral,
                        style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                        ),
                    ),
                    leading: const Icon(
                        Icons.psychology_outlined,
                        color: Colors.blue,
                    ),
                    iconColor: Colors.red,
                    children: [
                      const SizedBox(height: 6),
                      //Socializzazione
                      TextFormField(
                        controller: socializationDog,
                        decoration: const InputDecoration(
                          labelText: tSocializationDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateNameDog,
                      ),
                      const SizedBox(height: 12),

                      //Paure e Fobie
                      TextFormField(
                        controller: fearsOrPhobias,
                        decoration: const InputDecoration(
                          labelText: tFearsOrPhobiasDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateAgeDog,
                      ),
                      const SizedBox(height: 12),

                      //Livello energia
                      TextFormField(
                        controller: energyLevel,
                        decoration: const InputDecoration(
                          labelText: tEnergyLevelDog,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),

                      //Notes Abitudini
                      TextFormField(
                        controller: notesBehavioral,
                        decoration: const InputDecoration(
                          labelText: tNoteBehavioralDog,
                          border: OutlineInputBorder(),
                        ),
                        validator: FormDogValidator.validateBreed,
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white
                            ),
                            child:  const Text(tDelete)
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(tSave)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
