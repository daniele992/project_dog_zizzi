import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadService {
  final Dio _dio = Dio();

  Future<String?> uploadImage({
    required XFile file,
    required Function (double progress) onProgress,
  }) async {

    final formData = FormData.fromMap({
      "image" : await MultipartFile.fromFile(file.path),
    });

    final response = await _dio.post(
      "https://YOUR_API_URL/api/dogs",
      data: formData,
      onSendProgress: (sent, total) {
        final progress = sent / total;
        onProgress(progress);
      },
    );

    if(response.statusCode == 200){
      return response.data["imageUrl"];
    }

    return null;

  }
}