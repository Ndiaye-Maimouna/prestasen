import '../../../../core/network/repository_guard.dart';
import '../models/notification_model.dart';
import '../services/notification_api_service.dart';

class NotificationRepository {
  final NotificationApiService _apiService;

  NotificationRepository(this._apiService);

  Future<List<NotificationModel>> mesNotifications() {
    return repositoryGuard(() => _apiService.mesNotifications());
  }

  Future<int> compterNonLues() {
    return repositoryGuard(() => _apiService.compterNonLues());
  }

  Future<void> marquerCommeLue(String id) {
    return repositoryGuard(() => _apiService.marquerCommeLue(id));
  }

  Future<void> toutMarquerCommeLues() {
    return repositoryGuard(() => _apiService.toutMarquerCommeLues());
  }
}