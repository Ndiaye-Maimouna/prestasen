import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import '../../../auth/data/models/utilisateur_model.dart';

class UtilisateurApiService {
  final Dio _dio;

  UtilisateurApiService(this._dio);

  Future<UtilisateurModel> obtenirMonProfil() async {
    final response = await _dio.get('/users/me');
    return UtilisateurModel.fromJson(response.data);
  }

  Future<UtilisateurModel> mettreAJour({
    String? prenom,
    String? nom,
    String? email,
    String? region,
    String? ville,
  }) async {
    final response = await _dio.put('/users/me', data: {
      if (prenom != null) 'prenom': prenom,
      if (nom != null) 'nom': nom,
      if (email != null) 'email': email,
      if (region != null) 'region': region,
      if (ville != null) 'ville': ville,
    });
    return UtilisateurModel.fromJson(response.data);
  }

  Future<void> changerMotDePasse({required String ancienMotDePasse, required String nouveauMotDePasse}) async {
    await _dio.put('/users/me/mot-de-passe', data: {
      'ancienMotDePasse': ancienMotDePasse,
      'nouveauMotDePasse': nouveauMotDePasse,
    });
  }

  Future<UtilisateurModel> mettreAJourAvatar(XFile fichier) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(fichier.path, filename: fichier.name),
    });
    final response = await _dio.post(
      '/users/me/avatar',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );
    return UtilisateurModel.fromJson(response.data);
  }

  Future<void> enregistrerFcmToken(String token) async {
    await _dio.post('/users/me/fcm-token', data: {'token': token});
  }
}