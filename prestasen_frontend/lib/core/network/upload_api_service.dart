import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class UploadApiService {
  final Dio _dio;

  UploadApiService(this._dio);

  Future<String> uploaderImage(XFile fichier) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(fichier.path, filename: fichier.name),
    });
    final response = await _dio.post(
      '/upload',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return response.data['url'] as String;
  }

  Future<List<String>> uploaderPlusieursImages(List<XFile> fichiers) async {
    final urls = <String>[];
    for (final fichier in fichiers) {
      urls.add(await uploaderImage(fichier));
    }
    return urls;
  }
}