import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../data/models/notification_model.dart';
import '../../data/providers/notification_providers.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  IconData _iconePourType(TypeNotification type) {
    switch (type) {
      case TypeNotification.nouvelAvis:
        return LucideIcons.star;
      case TypeNotification.reponseAvis:
        return LucideIcons.messageCircle;
      case TypeNotification.bienvenue:
        return LucideIcons.sparkles;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationsAsync = ref.watch(mesNotificationsProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: const Text('Notifications'),
        actions: [
          TextButton(
            onPressed: () async {
              await ref.read(notificationRepositoryProvider).toutMarquerCommeLues();
              ref.invalidate(mesNotificationsProvider);
              ref.invalidate(nombreNotificationsNonLuesProvider);
            },
            child: const Text('Tout marquer lu'),
          ),
        ],
      ),
      body: notificationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (_, __) => const Center(child: Text('Impossible de charger les notifications')),
        data: (notifications) {
          if (notifications.isEmpty) {
            return const EmptyState(
              message: 'Aucune notification',
              sousMessage: 'Vous serez prévenu ici des nouveaux avis et réponses',
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSizes.lg),
            itemCount: notifications.length,
            separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return InkWell(
                onTap: () async {
                  if (!notification.lue) {
                    await ref.read(notificationRepositoryProvider).marquerCommeLue(notification.id);
                    ref.invalidate(mesNotificationsProvider);
                    ref.invalidate(nombreNotificationsNonLuesProvider);
                  }
                },
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                child: Container(
                  padding: const EdgeInsets.all(AppSizes.md),
                  decoration: BoxDecoration(
                    color: notification.lue ? AppColors.surface : AppColors.mint50,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(color: AppColors.mint100, shape: BoxShape.circle),
                        child: Icon(_iconePourType(notification.type), size: 17, color: AppColors.primaryDark),
                      ),
                      const SizedBox(width: AppSizes.sm),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(notification.titre,
                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                            const SizedBox(height: 2),
                            Text(notification.corps,
                                style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                            const SizedBox(height: 4),
                            Text(DateFormatter.relative(notification.dateCreation),
                                style: const TextStyle(fontSize: 11, color: AppColors.textDisabled)),
                          ],
                        ),
                      ),
                      if (!notification.lue)
                        Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(top: 4),
                          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}