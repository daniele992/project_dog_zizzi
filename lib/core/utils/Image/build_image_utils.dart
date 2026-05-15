import '../../constants/api_constants.dart';

String buildImageUrl(String? path) {
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http')) return path;

  return "${ApiConstants.serverUrl}$path";
}