import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/icone_categorie.dart';
import '../../features/categories/data/models/categorie_model.dart';

class CategoryChipList extends StatelessWidget {
  final List<CategorieModel> categories;
  final String? categorieSelectionneeId;
  final ValueChanged<String?> onSelectionChanged;

  const CategoryChipList({
    super.key,
    required this.categories,
    required this.categorieSelectionneeId,
    required this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length + 1,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.sm),
        itemBuilder: (context, index) {
          if (index == 0) {
            return _Chip(
              label: 'Tous',
              selectionne: categorieSelectionneeId == null,
              onTap: () => onSelectionChanged(null),
            );
          }
          final categorie = categories[index - 1];
          return _Chip(
            label: categorie.nom,
            selectionne: categorieSelectionneeId == categorie.id,
            onTap: () => onSelectionChanged(categorie.id),
          );
        },
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selectionne;
  final VoidCallback onTap;
  final String? icone;

  const _Chip({required this.label, required this.selectionne, required this.onTap, this.icone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 8),
        decoration: BoxDecoration(
          color: selectionne ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          border: Border.all(color: selectionne ? AppColors.primary : AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icone != null) ...[
              Icon(
                iconePourCategorie(icone),
                size: 14,
                color: selectionne ? Colors.white : AppColors.textSecondary,
              ),
              const SizedBox(width: 6),
            ],
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: selectionne ? Colors.white : AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}