import 'dart:io';

class ImageValidator {
  static const int maxSizeMB = 5;

  bool isValid(File file) {
    final sizeInMB = file.lengthSync() / (1024 * 1024);
    return sizeInMB <= maxSizeMB;
  }
}