import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/whatsapp_helper.dart';
import '../../../../shared/widgets/avis_card.dart';
import '../../../../shared/widgets/avis_form_sheet.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/mini_produit_card.dart';
import '../../../../shared/widgets/mini_service_card.dart';
import '../../../../shared/widgets/rating_stars.dart';
import '../../../../shared/widgets/section_header.dart';
import '../../../accueil/presentation/providers/suggestions_proximite_provider.dart';
import '../../../avis/data/models/avis_model.dart';
import '../../../profil/presentation/providers/mon_profil_presentation_providers.dart';
import '../providers/professionnel_presentation_providers.dart';

class ProfilProfessionnelScreen extends ConsumerWidget {
  final String professionnelId;

  const ProfilProfessionnelScreen({super.key, required this.professionnelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilAsync = ref.watch(profilProfessionnelDetailProvider(professionnelId));

    return Scaffold(
      backgroundColor: AppColors.background,
      body: profilAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (error, _) => const Center(
          child: EmptyState(message: 'Profil introuvable', sousMessage: 'Ce professionnel n\'est plus disponible'),
        ),
        data: (profil) {
          return DefaultTabController(
            length: 3,
            child: Stack(
              children: [
                NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverAppBar(
                      backgroundColor: AppColors.primary,
                      expandedHeight: 160,
                      pinned: true,
                      leading: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(LucideIcons.chevronLeft, color: Colors.white),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [AppColors.mint600, AppColors.mint400],
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 90),
                            child: SvgPicture.asset('assets/logo/logo_white.svg', width: 130),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: _EnTeteProfil(profil: profil),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _TabBarDelegate(
                        TabBar(
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textSecondary,
                          indicatorColor: AppColors.primary,
                          labelStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
                          tabs: [
                            Tab(text: 'Services (${profil.services.length})'),
                            Tab(text: 'Produits (${profil.produits.length})'),
                            Tab(text: 'Avis (${profil.avis.length})'),
                          ],
                        ),
                      ),
                    ),
                  ],
                  body: TabBarView(
                    children: [
                      _OngletServices(services: profil.services),
                      _OngletProduits(produits: profil.produits),
                      _OngletAvis(
                        professionnelId: profil.id,
                        utilisateurProprietaireId: profil.utilisateurId,
                        avis: profil.avis,
                      ),
                    ],
                  ),
                ),

                Consumer(
                  builder: (context, ref, _) {
                    final monUtilisateurAsync = ref.watch(monUtilisateurProvider);
                    // Tri-state : true = propre profil confirmé, false = confirmé différent,
                    // null = pas encore connu (chargement). On n'affiche le bouton que lorsqu'on
                    // est sûr à 100% que ce n'est pas le profil de l'utilisateur, pour éviter
                    // qu'il apparaisse brièvement puis disparaisse.
                    final estMonPropreProfil = monUtilisateurAsync.when(
                      data: (u) => u.id == profil.utilisateurId,
                      loading: () => null,
                      error: (_, __) => false,
                    );

                    if (estMonPropreProfil != false) return const SizedBox.shrink();

                    return Positioned(
                      left: AppSizes.lg,
                      right: AppSizes.lg,
                      bottom: AppSizes.lg,
                      child: ElevatedButton(
                        onPressed: () async {
                          final succes = await WhatsAppHelper.contacterDirectement(
                            telephoneProfessionnel: profil.telephone,
                            nomProfessionnel: profil.nom,
                          );

                          if (!context.mounted) return;

                          if (!succes) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Impossible d\'ouvrir WhatsApp. Vérifiez qu\'il est installé.',
                                ),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryDark,
                          elevation: 4,
                          shadowColor: AppColors.primaryDark.withOpacity(0.4),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LucideIcons.messageCircle,
                              size: 20,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            Text('Contacter via WhatsApp'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EnTeteProfil extends StatelessWidget {
  final dynamic profil;

  const _EnTeteProfil({required this.profil});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.md, AppSizes.lg, 0), // top normal, plus de négatif
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.background, width: 4),
              color: AppColors.mint100,
            ),
            child: ClipOval(
              child: (profil.photoUrl == null || profil.photoUrl.isEmpty)
                  ? Center(
                child: Text(
                  profil.nom.isNotEmpty ? profil.nom[0].toUpperCase() : '?',
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
                ),
              )
                  : CachedNetworkImage(imageUrl: profil.photoUrl!, fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: AppSizes.sm),
          Text(profil.nom, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 4),
          if (profil.categories.isNotEmpty)
            Text(
              (profil.categories as List<String>).join(' · '),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13.5, color: AppColors.primaryDark, fontWeight: FontWeight.w600),
            ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: AppSizes.md,
            runSpacing: 4,
            children: [
              RatingStars(note: profil.noteMoyenne, nombreAvis: profil.nombreAvis),
              if (profil.ville != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(LucideIcons.mapPin, size: 14, color: AppColors.textSecondary),
                    const SizedBox(width: 4),
                    Text(profil.ville!, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  ],
                ),
            ],
          ),
          if (profil.description != null && profil.description.isNotEmpty) ...[
            const SizedBox(height: AppSizes.md),
            Text(
              profil.description!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13.5, color: AppColors.textSecondary, height: 1.5),
            ),
          ],
          const SizedBox(height: AppSizes.md),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  _TabBarDelegate(this.tabBar);

  @override
  double get minExtent => 52;

  @override
  double get maxExtent => 52;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.background,
      height: 52,
      alignment: Alignment.center,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant _TabBarDelegate oldDelegate) => tabBar != oldDelegate.tabBar;
}

class _OngletServices extends StatelessWidget {
  final List services;
  const _OngletServices({required this.services});

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const EmptyState(message: 'Aucun service publié pour le moment');
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.md, AppSizes.lg, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(titre: 'Services proposés'),
          const SizedBox(height: AppSizes.md),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSizes.sm),
              itemBuilder: (context, index) => MiniServiceCard(
                service: services[index],
                onTap: () => context.push('/services/${services[index].id}?depuisProfil=true'),              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OngletProduits extends StatelessWidget {
  final List produits;
  const _OngletProduits({required this.produits});

  @override
  Widget build(BuildContext context) {
    if (produits.isEmpty) {
      return const EmptyState(message: 'Aucun produit publié pour le moment');
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.md, AppSizes.lg, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(titre: 'Produits en vente'),
          const SizedBox(height: AppSizes.md),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: produits.length,
              separatorBuilder: (_, __) => const SizedBox(width: AppSizes.sm),
              itemBuilder: (context, index) => MiniProduitCard(
                produit: produits[index],
                onTap: () => context.push('/produits/${produits[index].id}?depuisProfil=true'),              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OngletAvis extends ConsumerWidget {
  final String professionnelId;
  final String utilisateurProprietaireId;
  final List<AvisModel> avis;

  const _OngletAvis({
    required this.professionnelId,
    required this.utilisateurProprietaireId,
    required this.avis,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilisateurAsync = ref.watch(monUtilisateurProvider);

    return ListView(
      padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.md, AppSizes.lg, 110),
      children: [
        utilisateurAsync.when(
          data: (utilisateur) {
            // Un professionnel ne peut pas laisser d'avis sur son propre profil
            if (utilisateur.id == utilisateurProprietaireId) {
              return const SizedBox.shrink();
            }

            final monAvis = avis.where((a) => a.auteurId == utilisateur.id).firstOrNull;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSizes.md),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(LucideIcons.star, size: 16),
                  label: Text(monAvis != null ? 'Modifier mon avis' : 'Laisser un avis'),
                  onPressed: () => AvisFormSheet.afficher(
                    context,
                    professionnelId: professionnelId,
                    avisExistant: monAvis,
                    onSuccess: () {
                      ref.invalidate(profilProfessionnelDetailProvider(professionnelId));
                      ref.invalidate(rechercheProfessionnelsProvider);
                      ref.invalidate(suggestionsProchesProvider);
                    },
                  ),
                ),
              ),
            );
          },
          loading: () => const SizedBox.shrink(),
          error: (_, __) => const SizedBox.shrink(),
        ),
        if (avis.isEmpty)
          const EmptyState(message: 'Aucun avis pour le moment', sousMessage: 'Soyez le premier à évaluer ce professionnel')
        else
          ...avis.map((a) => AvisCard(avis: a)),
      ],
    );
  }
}