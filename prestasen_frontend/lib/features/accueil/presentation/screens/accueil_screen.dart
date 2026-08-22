import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../shared/widgets/notification_bell.dart';
import '../../../../shared/widgets/professionnel_card.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../categories/data/providers/categorie_providers.dart';
import '../../../professionnels/presentation/providers/professionnel_presentation_providers.dart';
import '../../../profil/presentation/providers/mon_profil_presentation_providers.dart';
import '../../../../core/utils/icone_categorie.dart';

class AccueilScreen extends ConsumerWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilisateurAsync = ref.watch(monUtilisateurProvider);
    final categoriesAsync = ref.watch(categoriesDisponiblesProvider);
    final professionnelsAsync = ref.watch(rechercheProfessionnelsProvider(exclureMoi: true));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () async {
            ref.invalidate(rechercheProfessionnelsProvider);
          },
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.lg),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: utilisateurAsync.when(
                      data: (u) => Text('Bonjour ${u.prenom}', style: Theme.of(context).textTheme.headlineMedium),
                      loading: () => const SizedBox(height: 28),
                      error: (_, __) => Text('Bonjour', style: Theme.of(context).textTheme.headlineMedium),
                    ),
                  ),
                  const NotificationBell(),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'Trouvez le bon prestataire, près de chez vous',
                style: TextStyle(color: AppColors.textSecondary, fontSize: 13.5),
              ),
              const SizedBox(height: AppSizes.lg),

              const SectionHeader(titre: 'Catégories'),
              const SizedBox(height: AppSizes.sm),
              categoriesAsync.when(
                data: (categories) => SizedBox(
                  height: 88,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (_, __) => const SizedBox(width: AppSizes.sm),
                    itemBuilder: (context, index) {
                      final categorie = categories[index];
                      return GestureDetector(
                        onTap: () => context.go('/recherche', extra: categorie.id),
                        child: Container(
                          width: 84,
                          padding: const EdgeInsets.all(AppSizes.sm),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(iconePourCategorie(categorie.icone), color: AppColors.primary, size: 22),
                              const SizedBox(height: 6),
                              Text(
                                categorie.nom,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                loading: () => const SizedBox(height: 88),
                error: (_, __) => const SizedBox.shrink(),
              ),
              const SizedBox(height: AppSizes.lg),

              SectionHeader(titre: 'Près de chez vous', actionLabel: 'Voir tout', onActionTap: () => context.go('/recherche')),
              const SizedBox(height: AppSizes.sm),
              professionnelsAsync.when(
                data: (professionnels) => Column(
                  children: professionnels.take(6).map((p) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.sm),
                      child: ProfessionnelCard(
                        professionnel: p,
                        onTap: () => context.push('/professionnels/${p.id}'),
                      ),
                    );
                  }).toList(),
                ),
                loading: () => const Center(child: Padding(
                  padding: EdgeInsets.all(AppSizes.lg),
                  child: CircularProgressIndicator(color: AppColors.primary),
                )),
                error: (_, __) => const Text('Impossible de charger les suggestions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}