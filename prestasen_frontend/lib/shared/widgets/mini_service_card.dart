import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/price_formatter.dart';
import '../../features/services/data/models/service_model.dart';

class MiniServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const MiniServiceCard({super.key, required this.service, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 168,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 11,
              child: service.images.isNotEmpty
                  ? CachedNetworkImage(imageUrl: service.images.first, fit: BoxFit.cover)
                  : Container(
                color: AppColors.mint50,
                alignment: Alignment.center,
                child: const Icon(Icons.design_services_outlined, color: AppColors.primaryLight, size: 28),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    service.titre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    PriceFormatter.formatIndicatif(service.prixIndicatif),
                    style: const TextStyle(fontSize: 12.5, color: AppColors.primaryDark, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}