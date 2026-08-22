import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class QuantityStepper extends StatelessWidget {
  final int valeur;
  final ValueChanged<int> onChanged;
  final int min;
  final int max;

  const QuantityStepper({
    super.key,
    required this.valeur,
    required this.onChanged,
    this.min = 1,
    this.max = 99,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mint50,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _bouton(
            icon: LucideIcons.minus,
            onTap: valeur > min ? () => onChanged(valeur - 1) : null,
          ),
          SizedBox(
            width: 40,
            child: Text(
              '$valeur',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary),
            ),
          ),
          _bouton(
            icon: LucideIcons.plus,
            onTap: valeur < max ? () => onChanged(valeur + 1) : null,
          ),
        ],
      ),
    );
  }

  Widget _bouton({required IconData icon, required VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Icon(icon, size: 18, color: onTap != null ? AppColors.primaryDark : AppColors.textDisabled),
      ),
    );
  }
}