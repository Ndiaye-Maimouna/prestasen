import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/upload_providers.dart';
import '../../../../shared/widgets/categorie_selector_sheet.dart';
import '../../../../shared/widgets/image_picker_grid.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../categories/data/providers/categorie_providers.dart';
import '../../../professionnels/presentation/providers/professionnel_presentation_providers.dart';
import '../../data/models/produit_model.dart';
import '../../data/models/produit_request_model.dart';
import '../../data/providers/produit_providers.dart';
import '../providers/produit_presentation_providers.dart';

class ProduitFormScreen extends ConsumerStatefulWidget {
  final String? produitId;

  const ProduitFormScreen({super.key, this.produitId});

  @override
  ConsumerState<ProduitFormScreen> createState() => _ProduitFormScreenState();
}

class _ProduitFormScreenState extends ConsumerState<ProduitFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titreController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _prixController = TextEditingController();

  String? _categorieId;
  List<String> _images = [];
  bool _envoiEnCours = false;
  bool _chargementInitialFait = false;

  bool get estEdition => widget.produitId != null;

  @override
  void dispose() {
    _titreController.dispose();
    _descriptionController.dispose();
    _prixController.dispose();
    super.dispose();
  }

  void _preRemplirSiEdition(ProduitModel produit) {
    if (_chargementInitialFait) return;
    _titreController.text = produit.titre;
    _descriptionController.text = produit.description ?? '';
    _prixController.text = produit.prix.toStringAsFixed(0);
    _chargementInitialFait = true;
    setState(() => _images = produit.images);
  }

  Future<void> _soumettre() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categorieId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Choisissez une catégorie')));
      return;
    }

    setState(() => _envoiEnCours = true);

    final donnees = ProduitRequestModel(
      titre: _titreController.text.trim(),
      description: _descriptionController.text.trim(),
      categorieId: _categorieId!,
      prix: double.parse(_prixController.text.trim()),
      images: _images,
    );

    try {
      final repository = ref.read(produitRepositoryProvider);
      if (estEdition) {
        await repository.mettreAJour(widget.produitId!, donnees);
      } else {
        await repository.creer(donnees);
      }
      ref.invalidate(monProfilProfessionnelProvider);
      if (mounted) context.pop();
    } catch (e) {
      final failure = e as Failure;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.messageAffichable), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesDisponiblesProvider);
    final uploadRepository = ref.watch(uploadRepositoryProvider);

    if (estEdition) {
      final produitAsync = ref.watch(produitDetailProvider(widget.produitId!));
      produitAsync.whenData(_preRemplirSiEdition);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: Text(estEdition ? 'Modifier le produit' : 'Nouveau produit'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, 0, AppSizes.lg, AppSizes.xl),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Photos', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              ImagePickerGrid(
                imagesUrls: _images,
                onChanged: (urls) => setState(() => _images = urls),
                onUpload: uploadRepository.uploaderImage,
              ),
              const SizedBox(height: AppSizes.lg),

              const Text('Titre', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _titreController,
                decoration: const InputDecoration(hintText: 'Ex : Gâteau anniversaire 2kg'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Titre requis' : null,
              ),
              const SizedBox(height: AppSizes.md),

              const Text('Catégorie', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              categoriesAsync.when(
                data: (categories) => CategorieSelectorField(
                  categories: categories,
                  categorieSelectionneeId: _categorieId,
                  onSelected: (c) => setState(() => _categorieId = c.id),
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => const Text('Impossible de charger les catégories'),
              ),
              const SizedBox(height: AppSizes.md),

              const Text('Prix (FCFA)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _prixController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Ex : 15000'),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) return 'Prix requis';
                  if (double.tryParse(v.trim()) == null) return 'Prix invalide';
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),

              const Text('Description', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Décrivez le produit'),
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: estEdition ? 'Enregistrer les modifications' : 'Publier le produit',
                chargement: _envoiEnCours,
                afficherFleche: false,
                onPressed: _soumettre,
              ),
            ],
          ),
        ),
      ),
    );
  }
}