import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadService {
  final Dio _dio = Dio();

  Future<String?> uploadImage({
    required XFile file,
    required String token,
    required Function (double progress) onProgress,
  }) async {

    final bytes = await file.readAsBytes();
    final formData = FormData.fromMap({
      "image" : MultipartFile.fromBytes(
        bytes,
        filename: file.name,
      ),
    });

    final response = await _dio.post(
      "http://localhost:5059/api/dogs",
      data: formData,
      options: Options(
        headers: {"Authorization": "Bearer $token"},
      ),
      onSendProgress: (sent, total) {
        final progress = sent / total;
        onProgress(progress);
      },
    );

    if(response.statusCode == 200){
      return response.data["image"];
    }

    return null;

  }
}