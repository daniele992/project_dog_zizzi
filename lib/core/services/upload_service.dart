import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/api_constants.dart';

class UploadService {
  final Dio _dio = Dio();

  Future<String> uploadImage(XFile file) async {
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path),
    });

    final response = await _dio.post(
      "${ApiConstants.baseUrl}/upload",
      data: formData,
    );

    return response.data["imageUrl"];
  }
}