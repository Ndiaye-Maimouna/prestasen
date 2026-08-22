import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../features/categories/data/models/categorie_model.dart';

class CategorieSelectorField extends StatelessWidget {
  final List<CategorieModel> categories;
  final String? categorieSelectionneeId;
  final ValueChanged<CategorieModel> onSelected;

  const CategorieSelectorField({
    super.key,
    required this.categories,
    required this.categorieSelectionneeId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final selectionnee = categories.where((c) => c.id == categorieSelectionneeId).firstOrNull;

    return GestureDetector(
      onTap: () => _ouvrirSelecteur(context),
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
            Expanded(
              child: Text(
                selectionnee?.nom ?? 'Choisir une catégorie',
                style: TextStyle(
                  fontSize: 15,
                  color: selectionnee != null ? AppColors.textPrimary : AppColors.textDisabled,
                ),
              ),
            ),
            const Icon(LucideIcons.chevronDown, size: 18, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  void _ouvrirSelecteur(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(vertical: AppSizes.sm),
          children: categories.map((categorie) {
            return ListTile(
              title: Text(categorie.nom),
              trailing: categorie.id == categorieSelectionneeId
                  ? const Icon(LucideIcons.check, color: AppColors.primary)
                  : null,
              onTap: () {
                onSelected(categorie);
                Navigator.of(context).pop();
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}