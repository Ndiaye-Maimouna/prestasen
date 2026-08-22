import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/mini_produit_card.dart';
import '../../../../shared/widgets/mini_service_card.dart';
import '../../../produits/data/providers/produit_providers.dart';
import '../../../services/data/providers/service_providers.dart';
import '../../../professionnels/presentation/providers/professionnel_presentation_providers.dart';

class MesAnnoncesScreen extends ConsumerStatefulWidget {
  const MesAnnoncesScreen({super.key});

  @override
  ConsumerState<MesAnnoncesScreen> createState() => _MesAnnoncesScreenState();
}

class _MesAnnoncesScreenState extends ConsumerState<MesAnnoncesScreen> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final monProfilAsync = ref.watch(monProfilProfessionnelProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: const Text('Mes annonces'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          tabs: const [Tab(text: 'Services'), Tab(text: 'Produits')],
        ),
      ),
      body: monProfilAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (_, __) => const Center(child: Text('Impossible de charger vos annonces')),
        data: (profil) => TabBarView(
          controller: _tabController,
          children: [
            _ListeServices(services: profil.services),
            _ListeProduits(produits: profil.produits),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        icon: const Icon(LucideIcons.plus, color: Colors.white),
        label: Text(
          _tabController.index == 0 ? 'Service' : 'Produit',
          style: const TextStyle(color: Colors.white),
        ),
        onPressed: () => context.push(
          _tabController.index == 0 ? '/mes-annonces/service/nouveau' : '/mes-annonces/produit/nouveau',
        ),
      ),
    );
  }
}

class _ListeServices extends ConsumerWidget {
  final List services;
  const _ListeServices({required this.services});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (services.isEmpty) {
      return const EmptyState(message: 'Aucun service publié', sousMessage: 'Ajoutez votre premier service avec le bouton +');
    }
    return GridView.builder(
      padding: const EdgeInsets.all(AppSizes.lg),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.sm,
        mainAxisSpacing: AppSizes.sm,
        childAspectRatio: 0.78,
      ),
      itemCount: services.length,
      itemBuilder: (context, index) {
        final service = services[index];
        return Stack(
          children: [
            MiniServiceCard(
              service: service,
              onTap: () => context.push('/mes-annonces/service/${service.id}/editer'),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: _BoutonSupprimer(
                onTap: () async {
                  await ref.read(serviceRepositoryProvider).desactiver(service.id);
                  ref.invalidate(monProfilProfessionnelProvider);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ListeProduits extends ConsumerWidget {
  final List produits;
  const _ListeProduits({required this.produits});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (produits.isEmpty) {
      return const EmptyState(message: 'Aucun produit publié', sousMessage: 'Ajoutez votre premier produit avec le bouton +');
    }
    return GridView.builder(
      padding: const EdgeInsets.all(AppSizes.lg),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.sm,
        mainAxisSpacing: AppSizes.sm,
        childAspectRatio: 0.78,
      ),
      itemCount: produits.length,
      itemBuilder: (context, index) {
        final produit = produits[index];
        return Stack(
          children: [
            MiniProduitCard(
              produit: produit,
              onTap: () => context.push('/mes-annonces/produit/${produit.id}/editer'),
            ),
            Positioned(
              top: 6,
              right: 6,
              child: _BoutonSupprimer(
                onTap: () async {
                  await ref.read(produitRepositoryProvider).desactiver(produit.id);
                  ref.invalidate(monProfilProfessionnelProvider);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _BoutonSupprimer extends StatelessWidget {
  final VoidCallback onTap;
  const _BoutonSupprimer({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Retirer cette annonce ?'),
          content: const Text('Elle ne sera plus visible par les clients.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('Annuler')),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onTap();
              },
              child: const Text('Retirer', style: TextStyle(color: AppColors.error)),
            ),
          ],
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
        child: const Icon(LucideIcons.trash2, size: 15, color: Colors.white),
      ),
    );
  }
}