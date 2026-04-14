import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_dog_zizzi/core/utils/image_picker_service.dart';

final imagePickerProvider = Provider<ImagePickerService>((ref) {
  return ImagePickerService();
});
