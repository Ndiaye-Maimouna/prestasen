import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/price_formatter.dart';
import '../../features/produits/data/models/produit_model.dart';

class ProduitListCard extends StatelessWidget {
  final ProduitModel produit;
  final VoidCallback onTap;

  const ProduitListCard({super.key, required this.produit, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.sm),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
              child: produit.images.isNotEmpty
                  ? CachedNetworkImage(imageUrl: produit.images.first, width: 64, height: 64, fit: BoxFit.cover)
                  : Container(
                width: 64,
                height: 64,
                color: AppColors.mint50,
                child: const Icon(LucideIcons.shoppingBag, color: AppColors.primaryLight, size: 22),
              ),
            ),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produit.titre, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  const SizedBox(height: 2),
                  Text(produit.professionnelNom, maxLines: 1, overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12.5, color: AppColors.textSecondary)),
                  const SizedBox(height: 4),
                  Text(PriceFormatter.format(produit.prix),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.primaryDark)),
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