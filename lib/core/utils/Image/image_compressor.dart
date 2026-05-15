import 'dart:io';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

class ImageCompressor {
  Future<File> compressImage(File file) async {
    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);

    if(image == null) return file;

    final compressed = img.encodeJpg(
      image,
      quality: 70 //Compressione
    );

    final dir = await getTemporaryDirectory();
    final targetPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

    final compressedFile = File(targetPath)..writeAsBytesSync(compressed);

    return compressedFile;

  }
}