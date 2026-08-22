import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../features/professionnels/data/models/profil_professionnel_model.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'rating_stars.dart';

class ProfessionnelCard extends StatelessWidget {
  final ProfilProfessionnelModel professionnel;
  final VoidCallback onTap;

  const ProfessionnelCard({super.key, required this.professionnel, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(url: professionnel.photoUrl, nom: professionnel.nom),
            const SizedBox(width: AppSizes.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    professionnel.nom,
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  if (professionnel.categories.isNotEmpty)
                    Text(
                      professionnel.categories.take(2).join(' · '),
                      style: const TextStyle(fontSize: 13, color: AppColors.primaryDark, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 6),
                  if (professionnel.ville != null)
                    Row(
                      children: [
                        const Icon(LucideIcons.mapPin, size: 14, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(
                          professionnel.ville!,
                          style: const TextStyle(fontSize: 12.5, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  RatingStars(
                    note: professionnel.noteMoyenne,
                    nombreAvis: professionnel.nombreAvis,
                    taille: 14,
                  ),
                ],
              ),
            ),
            const Icon(LucideIcons.chevronRight, size: 18, color: AppColors.textDisabled),
          ],
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  final String? url;
  final String nom;

  const _Avatar({required this.url, required this.nom});

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      final initiale = nom.isNotEmpty ? nom[0].toUpperCase() : '?';
      return Container(
        width: AppSizes.avatarSm,
        height: AppSizes.avatarSm,
        decoration: const BoxDecoration(color: AppColors.mint100, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Text(
          initiale,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.avatarSm / 2),
      child: CachedNetworkImage(
        imageUrl: url!,
        width: AppSizes.avatarSm,
        height: AppSizes.avatarSm,
        fit: BoxFit.cover,
        placeholder: (context, _) => Container(color: AppColors.mint50),
        errorWidget: (context, _, __) => Container(color: AppColors.mint50),
      ),
    );
  }
}