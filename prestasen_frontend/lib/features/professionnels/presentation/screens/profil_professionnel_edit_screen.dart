import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/providers/core_providers.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../categories/data/models/categorie_model.dart';
import '../../../categories/data/providers/categorie_providers.dart';
import '../../data/models/profil_professionnel_model.dart';
import '../../data/models/profil_professionnel_update_model.dart';
import '../../data/providers/professionnel_providers.dart';
import '../providers/professionnel_presentation_providers.dart';

class ProfilProfessionnelEditScreen extends ConsumerStatefulWidget {
  const ProfilProfessionnelEditScreen({super.key});

  @override
  ConsumerState<ProfilProfessionnelEditScreen> createState() => _ProfilProfessionnelEditScreenState();
}

class _ProfilProfessionnelEditScreenState extends ConsumerState<ProfilProfessionnelEditScreen> {
  final _descriptionController = TextEditingController();
  Set<String> _categorieIdsSelectionnees = {};
  double? _latitude;
  double? _longitude;
  String? _profilId;
  bool _initialise = false;
  bool _envoiEnCours = false;
  bool _localisationEnCours = false;

  void _preRemplir(ProfilProfessionnelModel profil, List<CategorieModel> categories) {    if (_initialise) return;
    _descriptionController.text = profil.description ?? '';
    _profilId = profil.id;
    _latitude = profil.latitude;
    _longitude = profil.longitude;
    _categorieIdsSelectionnees = categories
        .where((c) => profil.categories.contains(c.nom))
        .map((c) => c.id as String)
        .toSet();
    _initialise = true;
  }

  Future<void> _utiliserPositionActuelle() async {
    setState(() => _localisationEnCours = true);
    try {
      final resultat = await ref.read(locationServiceProvider).obtenirPositionInitiale();
      setState(() {
        _latitude = resultat.position.latitude;
        _longitude = resultat.position.longitude;
      });
    } finally {
      if (mounted) setState(() => _localisationEnCours = false);
    }
  }

  Future<void> _enregistrer() async {
    if (_profilId == null) return;
    setState(() => _envoiEnCours = true);

    try {
      await ref.read(professionnelRepositoryProvider).mettreAJour(
        _profilId!,
        ProfilProfessionnelUpdateModel(
          description: _descriptionController.text.trim(),
          categorieIds: _categorieIdsSelectionnees.toList(),
          latitude: _latitude,
          longitude: _longitude,
        ),
      );
      ref.invalidate(monProfilProfessionnelProvider);
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
    final profilAsync = ref.watch(monProfilProfessionnelProvider);
    final categoriesAsync = ref.watch(categoriesDisponiblesProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: const Text('Profil professionnel'),
      ),
      body: profilAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
        error: (_, __) => const Center(child: Text('Erreur de chargement')),
        data: (profil) {
          return categoriesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
            error: (_, __) => const Center(child: Text('Erreur de chargement')),
            data: (categories) {
              _preRemplir(profil, categories);

              return SingleChildScrollView(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                    const SizedBox(height: AppSizes.sm),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 4,
                      decoration: const InputDecoration(hintText: 'Présentez votre activité en quelques lignes'),
                    ),
                    const SizedBox(height: AppSizes.lg),

                    const Text('Catégories', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                    const SizedBox(height: AppSizes.sm),
                    Wrap(
                      spacing: AppSizes.sm,
                      runSpacing: AppSizes.sm,
                      children: categories.map((categorie) {
                        final selectionnee = _categorieIdsSelectionnees.contains(categorie.id);
                        return GestureDetector(
                          onTap: () => setState(() {
                            if (selectionnee) {
                              _categorieIdsSelectionnees.remove(categorie.id);
                            } else {
                              _categorieIdsSelectionnees.add(categorie.id);
                            }
                          }),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 8),
                            decoration: BoxDecoration(
                              color: selectionnee ? AppColors.primary : AppColors.mint50,
                              borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                            ),
                            child: Text(
                              categorie.nom,
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: selectionnee ? Colors.white : AppColors.primaryDark,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: AppSizes.lg),

                    const Text('Localisation', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                    const SizedBox(height: AppSizes.sm),
                    Container(
                      padding: const EdgeInsets.all(AppSizes.md),
                      decoration: BoxDecoration(color: AppColors.mint50, borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _latitude != null
                                  ? 'Position enregistrée (${_latitude!.toStringAsFixed(3)}, ${_longitude!.toStringAsFixed(3)})'
                                  : 'Aucune position enregistrée',
                              style: const TextStyle(fontSize: 13, color: AppColors.textSecondary),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: _localisationEnCours ? null : _utiliserPositionActuelle,
                            icon: _localisationEnCours
                                ? const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2))
                                : const Icon(LucideIcons.locateFixed, size: 16),
                            label: const Text('Actualiser'),
                          ),
                        ],
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
              );
            },
          );
        },
      ),
    );
  }
}