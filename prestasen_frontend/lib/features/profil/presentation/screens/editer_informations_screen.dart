import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/config/regions_senegal.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../providers/mon_profil_presentation_providers.dart';
import '../../data/providers/utilisateur_providers.dart';

class EditerInformationsScreen extends ConsumerStatefulWidget {
  const EditerInformationsScreen({super.key});

  @override
  ConsumerState<EditerInformationsScreen> createState() => _EditerInformationsScreenState();
}

class _EditerInformationsScreenState extends ConsumerState<EditerInformationsScreen> {
  final _prenomController = TextEditingController();
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();
  String? _region;
  bool _initialise = false;
  bool _envoiEnCours = false;

  void _preRemplir(utilisateur) {
    if (_initialise) return;
    _prenomController.text = utilisateur.prenom;
    _nomController.text = utilisateur.nom;
    _emailController.text = utilisateur.email ?? '';
    _region = utilisateur.region;
    _initialise = true;
  }

  Future<void> _enregistrer() async {
    setState(() => _envoiEnCours = true);
    try {
      await ref.read(utilisateurRepositoryProvider).mettreAJour(
        prenom: _prenomController.text.trim(),
        nom: _nomController.text.trim(),
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        region: _region,
      );
      ref.invalidate(monUtilisateurProvider);
      if (mounted) context.pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Échec de la mise à jour')));
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final utilisateurAsync = ref.watch(monUtilisateurProvider);
    utilisateurAsync.whenData(_preRemplir);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: const Text('Informations personnelles'),
      ),
      body: utilisateurAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (_, __) => const Center(child: Text('Erreur de chargement')),
        data: (_) => SingleChildScrollView(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _prenomController,
                      decoration: const InputDecoration(labelText: 'Prénom'),
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: TextFormField(
                      controller: _nomController,
                      decoration: const InputDecoration(labelText: 'Nom'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.md),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email (optionnel)'),
              ),
              const SizedBox(height: AppSizes.md),

              const Text('Région', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              GestureDetector(
                onTap: () => showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.surface,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
                  ),
                  builder: (context) => SafeArea(
                    child: ListView(
                      shrinkWrap: true,
                      children: RegionsSenegal.liste.map((region) {
                        return ListTile(
                          title: Text(region),
                          trailing: region == _region ? const Icon(LucideIcons.check, color: AppColors.primary) : null,
                          onTap: () {
                            setState(() => _region = region);
                            Navigator.pop(context);
                          },
                        );
                      }).toList(),
                    ),
                  ),
                ),
                child: Container(
                  height: 52,
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Text(_region ?? 'Choisir une région')),
                      const Icon(LucideIcons.chevronDown, size: 18, color: AppColors.textSecondary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: 'Enregistrer',
                chargement: _envoiEnCours,
                afficherFleche: false,
                onPressed: _enregistrer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}