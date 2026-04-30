import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickFromGallery() async {
    return await _picker.pickImage(source: ImageSource.gallery);
  }

  Future<XFile?> pickFromCamera() async {
    return await _picker.pickImage(source: ImageSource.camera);
  }

  Future<double> getSizeMB(XFile file) async {
    final bytes = await file.readAsBytes();
    return bytes.length / (1024 * 1024);
  }

  Future<Uint8List> getBytes(XFile file) async {
    return await file.readAsBytes();
  }



}