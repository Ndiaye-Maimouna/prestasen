import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/network/network_providers.dart';
import '../models/notification_model.dart';
import '../repositories/notification_repository.dart';
import '../services/notification_api_service.dart';

part 'notification_providers.g.dart';

@Riverpod(keepAlive: true)
NotificationApiService notificationApiService(NotificationApiServiceRef ref) {
  return NotificationApiService(ref.watch(dioProvider));
}

@Riverpod(keepAlive: true)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository(ref.watch(notificationApiServiceProvider));
}

@riverpod
Future<List<NotificationModel>> mesNotifications(MesNotificationsRef ref) {
  return ref.watch(notificationRepositoryProvider).mesNotifications();
}

@riverpod
Future<int> nombreNotificationsNonLues(NombreNotificationsNonLuesRef ref) {
  return ref.watch(notificationRepositoryProvider).compterNonLues();
}