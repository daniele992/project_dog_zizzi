import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';
import 'package:project_dog_zizzi/core/providers/addDog/add_dog_providers.dart';
import 'package:project_dog_zizzi/presentation/mappers/add_dog_form_mapper.dart';
import '../../../core/providers/addDog/dropdown_add_dog_provider.dart';
import '../../../core/utils/validators/form_add_dog_validators.dart';
import '../dropdown/dropdown_form_field_dog.dart';

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

    ref.listen<AsyncValue<void>>(addDogViewModelProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Cane aggiunto con successo!')),
          );
          Navigator.of(context).pop();
        },
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Errore: $error')),
          );
        },
      );
    });

    final state = ref.watch(addDogViewModelProvider);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(maxWidth: 400),
              child: SingleChildScrollView(
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
                                ),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Anni
                              TextFormField(
                                controller: ageDog,
                                decoration: const InputDecoration(
                                  labelText: tAgeDog,
                                ),
                                validator: FormDogValidator.validateAgeDog,
                              ),
                              const SizedBox(height: 12),

                              //Sesso
                              DropDownFormFieldDog(
                                asyncProvider: ref.watch(genderProvider), // AsyncValue<List<GenderDog>>
                                selectedProvider: genderSelectedProvider, // StateProvider<GenderDog?>
                                labelText: tGenderDog,
                                hintText: tSelectedGender,
                                getItemLabel: (gender) => gender.name ?? '',
                                validator: (value) => value == null
                                    ? 'Seleziona un genere valido'
                                    : null,
                              ),

                              const SizedBox(height: 12),

                              //Razza
                              TextFormField(
                                controller: breedDog,
                                decoration: const InputDecoration(
                                  labelText: tBreedDog,
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
                                ),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Tipo di cibo
                              TextFormField(
                                controller: typeFoodDog,
                                decoration: const InputDecoration(
                                  labelText: tTypeFoodDog,
                                ),
                                validator: FormDogValidator.validateAgeDog,
                              ),
                              const SizedBox(height: 12),

                              //Intolleranze
                              TextFormField(
                                controller: foodIntolerancesDog,
                                decoration: const InputDecoration(
                                  labelText: tFoodIntolerancesDog,
                                ),
                              ),
                              const SizedBox(height: 12),

                              //Patologie
                              TextFormField(
                                controller: pathologiesDog,
                                decoration: const InputDecoration(
                                  labelText: tPathologiesDog,
                                ),
                              ),
                              const SizedBox(height: 12),

                              //Notes Health
                              TextFormField(
                                controller: notesHealth,
                                decoration: const InputDecoration(
                                  labelText: tNoteHealthDog,
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
                                ),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Paure e Fobie
                              TextFormField(
                                controller: fearsOrPhobias,
                                decoration: const InputDecoration(
                                  labelText: tFearsOrPhobiasDog,
                                ),
                              ),
                              const SizedBox(height: 12),

                              //Livello energia
                              DropDownFormFieldDog(
                                asyncProvider: ref.watch(energyLevelProvider), // AsyncValue<List<GenderDog>>
                                selectedProvider: energyLevelSelectedProvider, // StateProvider<GenderDog?>
                                labelText: tEnergyLevelDog,
                                hintText: tSelectedEnergyLevel,
                                getItemLabel: (energyLevel) => energyLevel.name ?? '',
                                validator: (value) => value == null
                                    ? 'Seleziona un valore valido'
                                    : null,
                              ),
                              const SizedBox(height: 12),

                              //Notes Abitudini
                              TextFormField(
                                controller: notesBehavioral,
                                decoration: const InputDecoration(
                                  labelText: tNoteBehavioralDog,
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
                                        foregroundColor: Colors.white),
                                    child: const Text(tDelete)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                  onPressed: state.isLoading
                                      ?  null
                                      : () {
                                    if(_formKey.currentState!.validate()) {
                                      final selectedEnergyLevel = ref.read(energyLevelSelectedProvider);
                                      final String? energyLevelCodeToSave = selectedEnergyLevel?.code;
                                      final selectedGender = ref.read(genderSelectedProvider);
                                      final String? genderCodeToSave = selectedGender?.code;
                                      final model = mapFormToAddDogModel(
                                          ownerId: 1,
                                          name: nameDog.text,
                                          age: int.tryParse(ageDog.text) ?? 0, //Converto in int perchè dal form mi arriva una stringa
                                          gender: genderCodeToSave ?? 'S',
                                          breed: breedDog.text,
                                          allergy: allergyDog.text,
                                          foodIntolerances: foodIntolerancesDog.text,
                                          typeFood: typeFoodDog.text,
                                          pathologies: pathologiesDog.text,
                                          notesHealth: notesHealth.text,
                                          socialization: socializationDog.text,
                                          fearsOrPhobias: fearsOrPhobias.text,
                                          energyLevel: energyLevelCodeToSave ?? 'S',
                                          notesBehavioral: notesBehavioral.text
                                      );
                                      ref.read(addDogViewModelProvider.notifier).addDog(model);
                                    }
                                  },
                                  child: state.isLoading
                                      ? const CircularProgressIndicator(color: Colors.white)
                                      : const Text(tSave),
                                )
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))),
    );
  }
}
