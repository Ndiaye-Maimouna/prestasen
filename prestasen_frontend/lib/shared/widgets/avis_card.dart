import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/date_formatter.dart';
import '../../features/avis/data/models/avis_model.dart';
import 'rating_stars.dart';

class AvisCard extends StatelessWidget {
  final AvisModel avis;

  const AvisCard({super.key, required this.avis});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(bottom: AppSizes.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: const BoxDecoration(color: AppColors.mint100, shape: BoxShape.circle),
                alignment: Alignment.center,
                child: Text(
                  avis.auteurNom.isNotEmpty ? avis.auteurNom[0].toUpperCase() : '?',
                  style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.primaryDark, fontSize: 14),
                ),
              ),
              const SizedBox(width: AppSizes.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(avis.auteurNom, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13.5)),
                    Text(
                      DateFormatter.relative(avis.dateCreation),
                      style: const TextStyle(fontSize: 11.5, color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              RatingStars(note: avis.note.toDouble(), taille: 13),
            ],
          ),
          if (avis.commentaire != null && avis.commentaire!.isNotEmpty) ...[
            const SizedBox(height: AppSizes.sm),
            Text(avis.commentaire!, style: const TextStyle(fontSize: 13.5, color: AppColors.textPrimary, height: 1.4)),
          ],
          if (avis.reponseProfessionnel != null) ...[
            const SizedBox(height: AppSizes.sm),
            Container(
              padding: const EdgeInsets.all(AppSizes.sm),
              decoration: BoxDecoration(
                color: AppColors.mint50,
                borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                border: Border(left: BorderSide(color: AppColors.primary, width: 3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Réponse du professionnel',
                    style: TextStyle(fontSize: 11.5, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    avis.reponseProfessionnel!,
                    style: const TextStyle(fontSize: 13, color: AppColors.textPrimary, height: 1.4),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}