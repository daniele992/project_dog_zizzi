import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickFromGallery() async {
    final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
    );

    if(pickedFile != null){
      return File(pickedFile.path);
    }

    return null;
  }

  Future<File?> pickFromCamera() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
    );

    if (pickedFile != null) {
      return File(pickedFile.path);
    }

    return null;
  }

}