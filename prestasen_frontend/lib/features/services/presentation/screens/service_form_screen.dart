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
import '../../data/models/service_model.dart';
import '../../data/models/service_request_model.dart';
import '../../data/providers/service_providers.dart';
import '../providers/service_presentation_providers.dart';

class ServiceFormScreen extends ConsumerStatefulWidget {
  final String? serviceId;

  const ServiceFormScreen({super.key, this.serviceId});

  @override
  ConsumerState<ServiceFormScreen> createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends ConsumerState<ServiceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titreController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _prixController = TextEditingController();

  String? _categorieId;
  List<String> _images = [];
  bool _envoiEnCours = false;
  bool _chargementInitialFait = false;

  bool get estEdition => widget.serviceId != null;

  @override
  void dispose() {
    _titreController.dispose();
    _descriptionController.dispose();
    _prixController.dispose();
    super.dispose();
  }

  void _preRemplirSiEdition(ServiceModel service) {
    if (_chargementInitialFait) return;
    _titreController.text = service.titre;
    _descriptionController.text = service.description ?? '';
    _prixController.text = service.prixIndicatif?.toStringAsFixed(0) ?? '';
    _chargementInitialFait = true;
    setState(() => _images = service.images);
  }

  Future<void> _soumettre() async {
    if (!_formKey.currentState!.validate()) return;
    if (_categorieId == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Choisissez une catégorie')));
      return;
    }

    setState(() => _envoiEnCours = true);

    final donnees = ServiceRequestModel(
      titre: _titreController.text.trim(),
      description: _descriptionController.text.trim(),
      categorieId: _categorieId!,
      prixIndicatif: _prixController.text.trim().isEmpty ? null : double.tryParse(_prixController.text.trim()),
      images: _images,
    );

    try {
      final repository = ref.read(serviceRepositoryProvider);
      if (estEdition) {
        await repository.mettreAJour(widget.serviceId!, donnees);
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
      final serviceAsync = ref.watch(serviceDetailProvider(widget.serviceId!));
      serviceAsync.whenData(_preRemplirSiEdition);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: Text(estEdition ? 'Modifier le service' : 'Nouveau service'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, 0, AppSizes.lg, AppSizes.xl),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _Label('Photos'),
              const SizedBox(height: AppSizes.sm),
              ImagePickerGrid(
                imagesUrls: _images,
                onChanged: (urls) => setState(() => _images = urls),
                onUpload: uploadRepository.uploaderImage,
              ),
              const SizedBox(height: AppSizes.lg),

              const _Label('Titre'),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _titreController,
                decoration: const InputDecoration(hintText: 'Ex : Réparation plomberie à domicile'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Titre requis' : null,
              ),
              const SizedBox(height: AppSizes.md),

              const _Label('Catégorie'),
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

              const _Label('Prix indicatif (optionnel)'),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _prixController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(hintText: 'Laisser vide si "sur devis"'),
              ),
              const SizedBox(height: AppSizes.md),

              const _Label('Description'),
              const SizedBox(height: AppSizes.sm),
              TextFormField(
                controller: _descriptionController,
                maxLines: 4,
                decoration: const InputDecoration(hintText: 'Décrivez votre prestation en détail'),
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: estEdition ? 'Enregistrer les modifications' : 'Publier le service',
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

class _Label extends StatelessWidget {
  final String texte;
  const _Label(this.texte);

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
    );
  }
}