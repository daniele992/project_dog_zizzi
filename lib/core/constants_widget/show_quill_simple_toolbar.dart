import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';

class CustomQuillToolbar extends StatelessWidget {
  final QuillController controller;
  const CustomQuillToolbar({super.key, required this.controller});

  @override
  Widget build(BuildContext context){
    return QuillSimpleToolbar(
        controller: controller,
        config: const QuillSimpleToolbarConfig(
          showBoldButton: true,
          showItalicButton: false,
          showUnderLineButton: false,
          showStrikeThrough: false,
          showColorButton: true,
          showBackgroundColorButton: false,
          showAlignmentButtons: false,
          showListNumbers: false,
          showListBullets: false,
          showQuote: false,
          showCodeBlock: false,
          showSearchButton: false,
          showListCheck: false,
          showInlineCode: false,
          showLink: false,
          showSubscript: false,
          showSuperscript: false,
        ),
    );
  }
}