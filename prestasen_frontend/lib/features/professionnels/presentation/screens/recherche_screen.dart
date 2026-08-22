import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/config/regions_senegal.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../shared/widgets/card_shimmer.dart';
import '../../../../shared/widgets/category_chip_list.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/professionnel_card.dart';
import '../../../../shared/widgets/produit_list_card.dart';
import '../../../../shared/widgets/service_list_card.dart';
import '../../../categories/data/providers/categorie_providers.dart';
import '../../../produits/presentation/providers/produit_presentation_providers.dart';
import '../../../services/presentation/providers/service_presentation_providers.dart';
import '../providers/filtre_recherche_provider.dart';
import '../providers/professionnel_presentation_providers.dart';

class RechercheScreen extends ConsumerStatefulWidget {
  final String? categorieInitiale;

  const RechercheScreen({super.key, this.categorieInitiale});

  @override
  ConsumerState<RechercheScreen> createState() => _RechercheScreenState();
}

class _RechercheScreenState extends ConsumerState<RechercheScreen> {
  final _rechercheController = TextEditingController();
  Timer? _debounce;
  bool _categorieInitialeAppliquee = false;

  @override
  void initState() {
    super.initState();
    if (widget.categorieInitiale != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!_categorieInitialeAppliquee) {
          ref.read(filtreRechercheNotifierProvider.notifier).changerCategorie(widget.categorieInitiale);
          _categorieInitialeAppliquee = true;
        }
      });
    }
  }

  @override
  void dispose() {
    _rechercheController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onTexteChange(String valeur) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () {
      ref.read(filtreRechercheNotifierProvider.notifier).changerMotCle(valeur);
    });
  }

  Future<void> _choisirRegion() async {
    final filtre = ref.read(filtreRechercheNotifierProvider);
    final choix = await showModalBottomSheet<String?>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            ListTile(
              title: const Text('Toutes les régions'),
              trailing: filtre.region == null ? const Icon(LucideIcons.check, color: AppColors.primary) : null,
              onTap: () => Navigator.pop(context, null),
            ),
            ...RegionsSenegal.liste.map((region) => ListTile(
              title: Text(region),
              trailing: filtre.region == region ? const Icon(LucideIcons.check, color: AppColors.primary) : null,
              onTap: () => Navigator.pop(context, region),
            )),
          ],
        ),
      ),
    );
    ref.read(filtreRechercheNotifierProvider.notifier).changerRegion(choix);
  }

  @override
  Widget build(BuildContext context) {
    final filtre = ref.watch(filtreRechercheNotifierProvider);
    final categoriesAsync = ref.watch(categoriesDisponiblesProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.md, AppSizes.lg, AppSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recherche', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: AppSizes.md),
                    TextField(
                      controller: _rechercheController,
                      onChanged: _onTexteChange,
                      decoration: InputDecoration(
                        hintText: 'Plombier, couturière, gâteau...',
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(14),
                          child: Icon(LucideIcons.search, size: 20, color: AppColors.textSecondary),
                        ),
                        suffixIcon: _rechercheController.text.isNotEmpty
                            ? IconButton(
                          onPressed: () {
                            _rechercheController.clear();
                            ref.read(filtreRechercheNotifierProvider.notifier).changerMotCle('');
                          },
                          icon: const Icon(LucideIcons.x, size: 16, color: AppColors.textSecondary),
                        )
                            : null,
                      ),
                    ),
                    const SizedBox(height: AppSizes.md),
                    categoriesAsync.when(
                      data: (categories) => CategoryChipList(
                        categories: categories,
                        categorieSelectionneeId: filtre.categorieId,
                        onSelectionChanged: (id) =>
                            ref.read(filtreRechercheNotifierProvider.notifier).changerCategorie(id),
                      ),
                      loading: () => const SizedBox(height: 40),
                      error: (_, __) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    GestureDetector(
                      onTap: _choisirRegion,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 10),
                        decoration: BoxDecoration(
                          color: filtre.region != null ? AppColors.primary : AppColors.surface,
                          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                          border: Border.all(color: filtre.region != null ? AppColors.primary : AppColors.border),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(LucideIcons.mapPin, size: 15, color: filtre.region != null ? Colors.white : AppColors.textSecondary),
                            const SizedBox(width: 6),
                            Text(
                              filtre.region ?? 'Toutes les régions',
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: filtre.region != null ? Colors.white : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),
                    const TabBar(
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.textSecondary,
                      indicatorColor: AppColors.primary,
                      labelStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5),
                      tabs: [Tab(text: 'Professionnels'), Tab(text: 'Services'), Tab(text: 'Produits')],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _OngletProfessionnels(categorieId: filtre.categorieId, region: filtre.region, motCle: filtre.motCle),
                    _OngletServices(categorieId: filtre.categorieId, region: filtre.region, motCle: filtre.motCle),
                    _OngletProduits(categorieId: filtre.categorieId, region: filtre.region, motCle: filtre.motCle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OngletProfessionnels extends ConsumerWidget {
  final String? categorieId;
  final String? region;
  final String motCle;
  const _OngletProfessionnels({required this.categorieId, required this.region, required this.motCle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultatsAsync = ref.watch(rechercheProfessionnelsProvider(categorieId: categorieId, region: region));

    return resultatsAsync.when(
      loading: () => const _ChargementListe(),
      error: (_, __) => const EmptyState(message: 'Erreur de chargement'),
      data: (professionnels) {
        final filtres = motCle.trim().isEmpty
            ? professionnels
            : professionnels.where((p) => p.nom.toLowerCase().contains(motCle.toLowerCase())).toList();

        if (filtres.isEmpty) return const EmptyState(message: 'Aucun professionnel trouvé');

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.sm, AppSizes.lg, AppSizes.xl),
          itemCount: filtres.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
          itemBuilder: (context, index) => ProfessionnelCard(
            professionnel: filtres[index],
            onTap: () => context.push('/professionnels/${filtres[index].id}'),
          ),
        );
      },
    );
  }
}

class _OngletServices extends ConsumerWidget {
  final String? categorieId;
  final String? region;
  final String motCle;
  const _OngletServices({required this.categorieId, required this.region, required this.motCle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultatsAsync = ref.watch(rechercheServicesProvider(
      categorieId: categorieId,
      region: region,
      motCle: motCle.trim().isEmpty ? null : motCle.trim(),
    ));

    return resultatsAsync.when(
      loading: () => const _ChargementListe(),
      error: (_, __) => const EmptyState(message: 'Erreur de chargement'),
      data: (services) {
        if (services.isEmpty) return const EmptyState(message: 'Aucun service trouvé');
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.sm, AppSizes.lg, AppSizes.xl),
          itemCount: services.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
          itemBuilder: (context, index) => ServiceListCard(
            service: services[index],
            onTap: () => context.push('/services/${services[index].id}'),
          ),
        );
      },
    );
  }
}

class _OngletProduits extends ConsumerWidget {
  final String? categorieId;
  final String? region;
  final String motCle;
  const _OngletProduits({required this.categorieId, required this.region, required this.motCle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resultatsAsync = ref.watch(rechercheProduitsProvider(
      categorieId: categorieId,
      region: region,
      motCle: motCle.trim().isEmpty ? null : motCle.trim(),
    ));

    return resultatsAsync.when(
      loading: () => const _ChargementListe(),
      error: (_, __) => const EmptyState(message: 'Erreur de chargement'),
      data: (produits) {
        if (produits.isEmpty) return const EmptyState(message: 'Aucun produit trouvé');
        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.sm, AppSizes.lg, AppSizes.xl),
          itemCount: produits.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSizes.sm),
          itemBuilder: (context, index) => ProduitListCard(
            produit: produits[index],
            onTap: () => context.push('/produits/${produits[index].id}'),
          ),
        );
      },
    );
  }
}

class _ChargementListe extends StatelessWidget {
  const _ChargementListe();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.lg, vertical: AppSizes.sm),
      itemCount: 5,
      itemBuilder: (context, _) => const CardShimmer(),
    );
  }
}