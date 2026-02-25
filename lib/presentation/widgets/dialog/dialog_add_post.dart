import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter_quill_extensions/flutter_quill_extensions.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/constants/text_strings.dart';
import 'package:project_dog_zizzi/core/utils/validators/form_add_dog_validators.dart';
import '../../../core/constants_widget/show_quill_simple_toolbar.dart';
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
  late final QuillController _controller;
  final categoryPost = TextEditingController();
  final FocusNode _editorFocusNode = FocusNode();
  final ScrollController _editorScrollController = ScrollController();
  late final QuillController _titleController;
  late final QuillController _subTitleController;

  @override
  void initState() {
    super.initState();
    // Load document
    _controller = QuillController(
      document: Document(),
      selection: const TextSelection.collapsed(offset: 0),
      config: QuillControllerConfig(
        clipboardConfig: QuillClipboardConfig(
          enableExternalRichPaste: true,
          onImagePaste: (imageBytes) async {
            if (kIsWeb) return null;

            final newFileName = 'image-${DateTime.now().toIso8601String()}.png';

            final newPath = path.join(
              io.Directory.systemTemp.path,
              newFileName,
            );

            final file =
                await io.File(newPath).writeAsBytes(imageBytes, flush: true);

            return file.path;
          },
        ),
      ),
    );
    _titleController = QuillController.basic();
    _subTitleController = QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsetsGeometry.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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

                          //Toolbar Titolo
                          CustomQuillToolbar(controller: _titleController),
                          const SizedBox(height: 12),

                          //QuillEditor per il Titolo
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: QuillEditor(
                              controller: _titleController,
                              focusNode: FocusNode(),
                              scrollController: ScrollController(),
                              config: const QuillEditorConfig(
                                placeholder: 'Titolo...',
                                padding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          //Toolbar Sottotitolo
                          CustomQuillToolbar(controller: _subTitleController),
                          const SizedBox(height: 12),

                          //QuillEditor per il sottotitolo
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: QuillEditor(
                              controller: _subTitleController,
                              focusNode: FocusNode(),
                              scrollController: ScrollController(),
                              config: const QuillEditorConfig(
                                placeholder: 'Sottotitolo...',
                                padding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),

                          //Toolbar testo del post
                          CustomQuillToolbar(controller: _controller),
                          const SizedBox(height: 12),

                          //Testo Post
                          Container(
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: QuillEditor(
                                focusNode: _editorFocusNode,
                                scrollController: _editorScrollController,
                                controller: _controller,
                                config: QuillEditorConfig(
                                  placeholder: 'Start writing your notes...',
                                  padding: const EdgeInsets.all(16),
                                  embedBuilders: [
                                    ...FlutterQuillEmbeds.editorBuilders(),
                                    TimeStampEmbedBuilder(),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 16),
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
                          //Categoria
                          DropDownFormFieldDog(
                            asyncProvider: ref.watch(categoryPostProvider), // AsyncValue<List<GenderDog>>
                            selectedProvider: categorySelectedProvider, // StateProvider<GenderDog?>
                            labelText: tCategory,
                            hintText: tSelectedCategory,
                            getItemLabel: (category) => category.name ?? '',
                            validator: (value) => value == null
                                ? 'Seleziona una categoria valida'
                                : null,
                          ),
                          const SizedBox(height: 12),

                          //Priorità
                          DropDownFormFieldDog(
                            asyncProvider: ref.watch(priorityPostProvider), // AsyncValue<List<GenderDog>>
                            selectedProvider: prioritySelectedProvider, // StateProvider<GenderDog?>
                            labelText: tPriority,
                            hintText: tSelectedPriority,
                            getItemLabel: (priority) => priority.name ?? '',
                            validator: (value) => value == null
                                ? 'Seleziona una valore valido'
                                : null,
                          ),
                          const SizedBox(height: 12),

                        ],
                      ),
                      const SizedBox(height: 16),
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

class TimeStampEmbed extends Embeddable {
  const TimeStampEmbed(
    String value,
  ) : super(timeStampType, value);

  static const String timeStampType = 'timeStamp';

  static TimeStampEmbed fromDocument(Document document) =>
      TimeStampEmbed(jsonEncode(document.toDelta().toJson()));

  Document get document => Document.fromJson(jsonDecode(data));
}

class TimeStampEmbedBuilder extends EmbedBuilder {
  @override
  String get key => 'timeStamp';

  @override
  String toPlainText(Embed node) {
    return node.value.data;
  }

  @override
  Widget build(
    BuildContext context,
    EmbedContext embedContext,
  ) {
    return Row(
      children: [
        const Icon(Icons.access_time_rounded),
        Text(embedContext.node.value.data as String),
      ],
    );
  }
}
