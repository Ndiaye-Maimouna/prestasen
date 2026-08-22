import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/profil/data/providers/utilisateur_providers.dart';

part 'push_notification_service.g.dart';

class PushNotificationService {
  final Ref _ref;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _initialise = false;

  PushNotificationService(this._ref);

  Future<void> initialiser() async {
    if (_initialise) return;
    _initialise = true;

    final messaging = FirebaseMessaging.instance;

    final permission = await messaging.requestPermission(alert: true, badge: true, sound: true);
    if (permission.authorizationStatus == AuthorizationStatus.denied) {
      return;
    }

    await _initialiserNotificationsLocales();

    final token = await messaging.getToken();
    if (token != null) {
      await _envoyerTokenAuBackend(token);
    }

    messaging.onTokenRefresh.listen(_envoyerTokenAuBackend);

    FirebaseMessaging.onMessage.listen(_afficherNotificationLocale);
  }

  Future<void> _envoyerTokenAuBackend(String token) async {
    try {
      await _ref.read(utilisateurRepositoryProvider).enregistrerFcmToken(token);
    } catch (_) {}
  }

  Future<void> _initialiserNotificationsLocales() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();
    const settings = InitializationSettings(android: androidSettings, iOS: iosSettings);
    await _localNotifications.initialize(settings);
  }

  Future<void> _afficherNotificationLocale(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    const androidDetails = AndroidNotificationDetails(
      'prestasen_default',
      'Notifications Prestasen',
      importance: Importance.high,
      priority: Priority.high,
    );
    const details = NotificationDetails(android: androidDetails, iOS: DarwinNotificationDetails());

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
    );
  }
}

@Riverpod(keepAlive: true)
PushNotificationService pushNotificationService(PushNotificationServiceRef ref) {
  return PushNotificationService(ref);
}