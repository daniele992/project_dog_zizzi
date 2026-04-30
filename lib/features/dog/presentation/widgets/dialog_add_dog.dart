import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';
import 'package:project_dog_zizzi/core/providers/media/image_picker_provider.dart';
import 'package:project_dog_zizzi/core/services/upload_service.dart';
import '../../../../core/providers/authRepository/user_provider.dart';
import '../../../../core/providers/dog/dog_providers.dart';
import '../../../../core/providers/dog/dropdown_add_dog_provider.dart';
import '../../../../core/utils/validators/form_add_dog_validators.dart';
import '../../domain/entities/dog.dart';
import 'dropdown_form_field_dog.dart';

class ShowDialogAddDog extends ConsumerStatefulWidget {
  const ShowDialogAddDog({super.key});

  @override
  ConsumerState<ShowDialogAddDog> createState() => _ShowDialogAddDog();
}

class _ShowDialogAddDog extends ConsumerState<ShowDialogAddDog> {
  final _formKey = GlobalKey<FormState>();

  XFile? _image;
  double _uploadProgress = 0;
  Uint8List? _imageBytes;

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

  Future<void> _pickImage() async {
    final service = ref.read(imagePickerProvider);

    final file = await service.pickFromGallery();

    if (file == null) return;

    // VALIDAZIONE DIMENSIONE
    final sizeMB = await service.getSizeMB(file);
    if (sizeMB > 5) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Immagine troppo grande (max 5MB)")),
      );
      return;
    }

    final bytes = await service.getBytes(file);

    setState(() {
      _image = file;
      _imageBytes = bytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(addDogViewModelProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(tSuccessAddDog)),
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

    final imageService = ref.read(imagePickerProvider);
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
                                decoration: const InputDecoration(labelText: tName),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Anni
                              TextFormField(
                                controller: ageDog,
                                decoration: const InputDecoration(labelText: tAgeDog),
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
                                decoration: const InputDecoration(labelText: tBreedDog,
                                ),
                                //validator: FormDogValidator.validateBreed,
                              ),

                              const SizedBox(height: 12),

                              //Dog Image
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    tPhotoDog,
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),

                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: _pickImage,
                                          icon: const Icon(Icons.photo_library),
                                          label: const Text(tChooseFromGallery),
                                        ),
                                      ),

                                      const SizedBox(width: 10),

                                      Expanded(
                                        child: ElevatedButton.icon(
                                          onPressed: () async {
                                            final imageService = ref.read(imagePickerProvider);
                                            final file = await imageService.pickFromGallery();

                                            if (file != null) {
                                              setState(() {
                                                _image = file;
                                              });
                                            }
                                          },
                                          icon: const Icon(Icons.camera_alt),
                                          label: const Text(tTakePhoto),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  //Previw Immagine
                                  _imageBytes != null
                                      ? Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.memory(
                                          _imageBytes!,
                                          height: 150,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      IconButton(
                                          icon: const Icon(
                                              Icons.close,
                                              color: Colors.red
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _image = null;
                                              _imageBytes = null;
                                              _uploadProgress = 0;
                                            });
                                          },
                                      ),
                                    ],
                                  ) : Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Center(
                                      child: Text(tNoImageSelection),
                                    ),
                                  ),
                                  const SizedBox(height: 10),

                                  //Progress Bar
                                  if(_uploadProgress > 0 && _uploadProgress < 1)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          LinearProgressIndicator(value: _uploadProgress),
                                          const SizedBox(height: 5),
                                          Text("${(_uploadProgress * 100).toStringAsFixed(0)}%"),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // --------------------- SALUTE E ALIMENTAZIONE ---------------------
                          ExpansionTile(
                            title: const Text(
                              tTitleHealth,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: const Text(
                              tSubTitleHealth,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic
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
                                decoration: const InputDecoration(labelText: tAllergyDog),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Tipo di cibo
                              TextFormField(
                                controller: typeFoodDog,
                                decoration: const InputDecoration(labelText: tTypeFoodDog),
                                validator: FormDogValidator.validateAgeDog,
                              ),
                              const SizedBox(height: 12),

                              //Intolleranze
                              TextFormField(
                                controller: foodIntolerancesDog,
                                decoration: const InputDecoration(labelText: tFoodIntolerancesDog),
                              ),
                              const SizedBox(height: 12),

                              //Patologie
                              TextFormField(
                                controller: pathologiesDog,
                                decoration: const InputDecoration(labelText: tPathologiesDog),
                              ),
                              const SizedBox(height: 12),

                              //Notes Health
                              TextFormField(
                                controller: notesHealth,
                                decoration: const InputDecoration(labelText: tNoteHealthDog),
                                validator: FormDogValidator.validateBreed,
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          // --------------------- COMPORTAMENTO ---------------------
                          ExpansionTile(
                            title: const Text(
                              tBehavior,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                decoration: const InputDecoration(labelText: tSocializationDog),
                                validator: FormDogValidator.validateNameDog,
                              ),
                              const SizedBox(height: 12),

                              //Paure e Fobie
                              TextFormField(
                                controller: fearsOrPhobias,
                                decoration: const InputDecoration(labelText: tFearsOrPhobiasDog),
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
                                decoration: const InputDecoration(labelText: tNoteBehavioralDog),
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
                                    child: const Text(tDelete)),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                  child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                                onPressed: state.isLoading
                                    ? null
                                    : () async {
                                        if (_formKey.currentState!.validate()) {
                                          final selectedEnergyLevel = ref.read(energyLevelSelectedProvider);
                                          final selectedGender = ref.read(genderSelectedProvider);
                                          final ownerId = ref.watch(userIdProvider).value;

                                          if (ownerId == null) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(content: Text("Utente non autenticato")),
                                            );
                                            return;
                                          }

                                          final dog = Dog(
                                              id: 0, // verrà generato dal backend
                                              ownerId: ownerId, // recuperalo dal user loggato
                                              name: nameDog.text,
                                              age: int.tryParse(ageDog.text) ?? 0,
                                              gender: selectedGender?.code ?? 'S',
                                              breed: breedDog.text,
                                              socialization: socializationDog.text,
                                              fearsOrPhobias: fearsOrPhobias.text,
                                              energyLevel: selectedEnergyLevel?.code ?? 'M',
                                              notesHealth: notesHealth.text,
                                              allergy: allergyDog.text,
                                              foodIntolerances: foodIntolerancesDog.text,
                                              pathologies: pathologiesDog.text,
                                              typeFood: typeFoodDog.text,
                                              notesBehavioral: notesBehavioral.text
                                          );

                                          //Upload con progress
                                          if(_image != null){
                                            final uploadService = UploadService();

                                            await uploadService.uploadImage(
                                                file: _image!,
                                                onProgress: (progress) {
                                                  setState(() {
                                                    _uploadProgress = progress;
                                                  });
                                                }, token: '',
                                            );
                                          }

                                          //Salva cane
                                          ref.read(addDogViewModelProvider.notifier).addDog(dog, imageFile: _image);
                                        }
                                      },
                                child: state.isLoading
                                    ? const CircularProgressIndicator(color: Colors.white)
                                    : const Text(tSave),
                              ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          )
      ),
    );
  }
}
