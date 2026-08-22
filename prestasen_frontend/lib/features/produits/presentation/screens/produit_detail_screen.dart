import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../shared/widgets/contact_produit_sheet.dart';
import '../../../../shared/widgets/image_gallery.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../professionnels/presentation/providers/professionnel_presentation_providers.dart';
import '../providers/produit_presentation_providers.dart';

class ProduitDetailScreen extends ConsumerWidget {
  final String produitId;
  final bool masquerNavigationProfessionnel;

  const ProduitDetailScreen({
    super.key,
    required this.produitId,
    this.masquerNavigationProfessionnel = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produitAsync = ref.watch(produitDetailProvider(produitId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: produitAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (error, _) => const Center(child: Text('Produit introuvable')),
        data: (produit) {
          final monProfilAsync = ref.watch(monProfilProfessionnelProvider);
          // Tri-state : true = propriétaire confirmé, false = non-propriétaire confirmé,
          // null = statut pas encore connu (chargement). On évite ainsi tout flash d'un état
          // provisoire incorrect (bouton, bannière, padding) le temps que la vraie réponse arrive.
          final estProprietaire = monProfilAsync.when(
            data: (p) => p.id == produit.professionnelId,
            loading: () => null,
            error: (_, __) => false, // erreur = probablement un compte CLIENT
          );

          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: AppColors.surface,
                    pinned: true,
                    leading: IconButton(
                      onPressed: () => context.pop(),
                      icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
                    ),
                    expandedHeight: 280,
                    flexibleSpace: FlexibleSpaceBar(
                      background: ImageGallery(images: produit.images, height: 280),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        AppSizes.lg,
                        AppSizes.lg,
                        AppSizes.lg,
                        estProprietaire == true ? AppSizes.lg : 120,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.sm, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.mint50,
                              borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                            ),
                            child: Text(
                              produit.categorieNom,
                              style: const TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
                            ),
                          ),
                          const SizedBox(height: AppSizes.sm),

                          Text(produit.titre, style: Theme.of(context).textTheme.headlineMedium),
                          const SizedBox(height: 6),
                          Text(
                            PriceFormatter.format(produit.prix),
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.primary),
                          ),

                          const SizedBox(height: AppSizes.lg),
                          _CarteProfessionnel(
                            nom: produit.professionnelNom,
                            label: 'Vendu par',
                            navigable: !masquerNavigationProfessionnel,
                            onTap: () => context.push('/professionnels/${produit.professionnelId}'),
                          ),

                          const SizedBox(height: AppSizes.lg),
                          const Text(
                            'Description',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: AppSizes.sm),
                          Text(
                            produit.description?.isNotEmpty == true
                                ? produit.description!
                                : 'Aucune description fournie.',
                            style: const TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.55),
                          ),

                          if (estProprietaire == true) ...[
                            const SizedBox(height: AppSizes.lg),
                            Container(
                              padding: const EdgeInsets.all(AppSizes.sm),
                              decoration: BoxDecoration(
                                color: AppColors.mint50,
                                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                              ),
                              child: const Row(
                                children: [
                                  Icon(LucideIcons.info, size: 16, color: AppColors.primaryDark),
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      'Ceci est votre propre produit',
                                      style: TextStyle(fontSize: 12.5, color: AppColors.primaryDark, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Correctif : on n'affiche le bouton "Commander" que lorsqu'on sait
              // avec certitude (estProprietaire == false) que l'utilisateur n'est pas
              // propriétaire du produit. Tant que le statut est inconnu (null, en chargement),
              // on n'affiche rien, au lieu d'afficher le bouton puis de le faire disparaître.
              if (estProprietaire == false) _boutonCommander(context, ref, produit),
            ],
          );
        },
      ),
    );
  }

  Widget _boutonCommander(BuildContext context, WidgetRef ref, dynamic produit) {
    return Positioned(
      left: AppSizes.lg,
      right: AppSizes.lg,
      bottom: AppSizes.lg,
      child: PrimaryButton(
        label: 'Commander',
        afficherFleche: false,
        onPressed: () async {
          final professionnel =
          await ref.read(profilProfessionnelDetailProvider(produit.professionnelId).future);
          if (context.mounted) {
            ContactProduitSheet.afficher(
              context,
              telephoneProfessionnel: professionnel.telephone,
              nomProfessionnel: professionnel.nom,
              nomProduit: produit.titre,
              prixUnitaire: produit.prix,
            );
          }
        },
      ),
    );
  }
}

/// Carte "Vendu par X" — cliquable ou non selon le contexte de navigation.
class _CarteProfessionnel extends StatelessWidget {
  final String nom;
  final String label;
  final bool navigable;
  final VoidCallback onTap;

  const _CarteProfessionnel({
    required this.nom,
    required this.label,
    required this.navigable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final contenu = Container(
      padding: const EdgeInsets.all(AppSizes.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(color: AppColors.mint100, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              nom.isNotEmpty ? nom[0].toUpperCase() : '?',
              style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryDark),
            ),
          ),
          const SizedBox(width: AppSizes.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 11.5, color: AppColors.textSecondary)),
                Text(nom, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
              ],
            ),
          ),
          if (navigable) const Icon(LucideIcons.chevronRight, size: 18, color: AppColors.textDisabled),
        ],
      ),
    );

    if (!navigable) return contenu;
    return GestureDetector(onTap: onTap, child: contenu);
  }
}