import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_dog_zizzi/core/utils/Image/build_image_utils.dart';
import 'package:project_dog_zizzi/features/dog/domain/entities/dog.dart';
import 'package:project_dog_zizzi/features/dog/presentation/widgets/dog_custom_label_text.dart';

class DogDetailPage extends StatefulWidget {
  final Dog dog;

  const DogDetailPage({
    super.key,
    required this.dog,
  });

  @override
  State<DogDetailPage> createState () => _DogDetailPageState();

}

class _DogDetailPageState extends State<DogDetailPage>{
  bool _showContent = false;

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(milliseconds: 300), (){
      if(mounted){
        setState(() {
          _showContent = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context){
    final dog = widget.dog;

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(
              dog.name.toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(dog.imageUrl != null)
              Hero(
                tag: dog.imageUrl!,
                child: SizedBox(
                  width: double.infinity,
                  height: 320,
                  child: Image.network(
                    buildImageUrl(dog.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              Container(
                height: 320,
                width: double.infinity,
                color: Colors.grey.shade300,
                child: const Icon(
                  Icons.pets,
                  size: 120,
                ),
              ),

            //CONTENT
            Padding(
                padding: const EdgeInsets.all(20),
                child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _showContent ? 1 : 0,
                    child: AnimatedSlide(
                        duration: const Duration(milliseconds: 500),
                        offset: _showContent
                            ? Offset.zero
                            : const Offset(0, 0.1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //NAME
                            Text(
                              dog.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 25),

                            //BASIC INFO CARD
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    DogCustomLabelText(
                                        label: "Razza",
                                        value: dog.breed,
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Età",
                                      value: "${dog.age} anni",
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Sesso",
                                      value: dog.gender,
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Razza",
                                      value: dog.breed,
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Energia",
                                      value: dog.energyLevel,
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Socializzazione",
                                      value: dog.socialization,
                                    ),

                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            //HEALTH SECTION
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      const Text(
                                        "SALUTE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      DogCustomLabelText(
                                        label: "Allergie",
                                        value: dog.allergy,
                                      ),
                                      const SizedBox(height: 10),

                                      DogCustomLabelText(
                                        label: "Intolleranze",
                                        value: dog.foodIntolerances,
                                      ),

                                      const SizedBox(height: 10),

                                      DogCustomLabelText(
                                        label: "Alimentazione",
                                        value: dog.typeFood,
                                      ),

                                      const SizedBox(height: 10),

                                      DogCustomLabelText(
                                        label: "Patologie",
                                        value: dog.pathologies,
                                      ),

                                      const SizedBox(height: 10),

                                      DogCustomLabelText(
                                        label: "Note salute",
                                        value: dog.notesHealth,
                                      ),

                                    ],
                                  ),
                              ),
                            ),

                            const SizedBox(height: 20),

                            //BEHAVIOR SECTION
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),

                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    const Text(
                                      "COMPORTAMENTO",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    const SizedBox(height: 16),

                                    DogCustomLabelText(
                                      label: "Paure/Fobie",
                                      value: dog.fearsOrPhobias,
                                    ),

                                    const SizedBox(height: 10),

                                    DogCustomLabelText(
                                      label: "Note comportamentali",
                                      value: dog.notesBehavioral,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 30),

                          ],
                        ),
                    ),
                ),
            )
          ],
        ),
      )
    );
  }
}