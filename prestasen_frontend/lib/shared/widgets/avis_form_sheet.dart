import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../features/avis/data/models/avis_model.dart';
import '../../features/avis/data/providers/avis_providers.dart';
import 'primary_button.dart';

class AvisFormSheet extends ConsumerStatefulWidget {
  final String professionnelId;
  final AvisModel? avisExistant;
  final VoidCallback onSuccess;

  const AvisFormSheet({
    super.key,
    required this.professionnelId,
    required this.onSuccess,
    this.avisExistant,
  });

  static Future<void> afficher(
      BuildContext context, {
        required String professionnelId,
        required VoidCallback onSuccess,
        AvisModel? avisExistant,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AvisFormSheet(
        professionnelId: professionnelId,
        avisExistant: avisExistant,
        onSuccess: onSuccess,
      ),
    );
  }

  @override
  ConsumerState<AvisFormSheet> createState() => _AvisFormSheetState();
}

class _AvisFormSheetState extends ConsumerState<AvisFormSheet> {
  late double _note;
  late final TextEditingController _commentaireController;
  bool _envoiEnCours = false;

  bool get estModification => widget.avisExistant != null;

  @override
  void initState() {
    super.initState();
    _note = widget.avisExistant?.note.toDouble() ?? 5;
    _commentaireController = TextEditingController(text: widget.avisExistant?.commentaire ?? '');
  }

  @override
  void dispose() {
    _commentaireController.dispose();
    super.dispose();
  }

  Future<void> _envoyer() async {
    setState(() => _envoiEnCours = true);
    try {
      final repository = ref.read(avisRepositoryProvider);
      final commentaire = _commentaireController.text.trim().isEmpty ? null : _commentaireController.text.trim();

      if (estModification) {
        await repository.modifier(widget.avisExistant!.id, note: _note.round(), commentaire: commentaire);
      } else {
        await repository.creer(professionnelId: widget.professionnelId, note: _note.round(), commentaire: commentaire);
      }

      if (mounted) {
        Navigator.of(context).pop();
        widget.onSuccess();
      }
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de l\'envoi de votre avis')),
        );
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg + 4)),
        ),
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.sm, AppSizes.lg, AppSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSizes.md),
                decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            Text(
              estModification ? 'Modifier votre avis' : 'Laisser un avis',
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
            ),
            const SizedBox(height: AppSizes.lg),

            Center(
              child: RatingBar.builder(
                initialRating: _note,
                minRating: 1,
                itemSize: 36,
                itemPadding: const EdgeInsets.symmetric(horizontal: 3),
                itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: AppColors.etoile),
                unratedColor: AppColors.border,
                onRatingUpdate: (valeur) => setState(() => _note = valeur),
              ),
            ),
            const SizedBox(height: AppSizes.lg),

            const Text('Commentaire (optionnel)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
            const SizedBox(height: AppSizes.sm),
            TextField(
              controller: _commentaireController,
              maxLines: 3,
              decoration: const InputDecoration(hintText: 'Partagez votre expérience'),
            ),
            const SizedBox(height: AppSizes.lg),

            PrimaryButton(
              label: estModification ? 'Enregistrer' : 'Publier mon avis',
              chargement: _envoiEnCours,
              afficherFleche: false,
              onPressed: _envoyer,
            ),
          ],
        ),
      ),
    );
  }
}