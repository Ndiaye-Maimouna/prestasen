import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

enum RoleChoix { client, professionnel }

class RoleSelector extends StatelessWidget {
  final RoleChoix selection;
  final ValueChanged<RoleChoix> onChanged;

  const RoleSelector({super.key, required this.selection, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.mint50,
        borderRadius: BorderRadius.circular(AppSizes.radiusMd + 4),
      ),
      child: Row(
        children: [
          _option(label: 'Client', icon: LucideIcons.user, valeur: RoleChoix.client),
          _option(label: 'Professionnel', icon: LucideIcons.briefcase, valeur: RoleChoix.professionnel),
        ],
      ),
    );
  }

  Widget _option({required String label, required IconData icon, required RoleChoix valeur}) {
    final estSelectionne = selection == valeur;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(valeur),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: estSelectionne ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: estSelectionne ? Colors.white : AppColors.textSecondary),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: estSelectionne ? Colors.white : AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}