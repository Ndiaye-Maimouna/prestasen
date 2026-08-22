import 'package:image_picker/image_picker.dart';
import 'repository_guard.dart';
import 'upload_api_service.dart';

class UploadRepository {
  final UploadApiService _apiService;

  UploadRepository(this._apiService);

  Future<String> uploaderImage(XFile fichier) {
    return repositoryGuard(() => _apiService.uploaderImage(fichier));
  }

  Future<List<String>> uploaderPlusieursImages(List<XFile> fichiers) {
    return repositoryGuard(() => _apiService.uploaderPlusieursImages(fichiers));
  }
}