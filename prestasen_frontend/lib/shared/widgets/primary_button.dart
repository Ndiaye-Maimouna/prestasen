import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool chargement;
  final bool afficherFleche;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.chargement = false,
    this.afficherFleche = true,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: chargement ? null : onPressed,
      child: chargement
          ? const SizedBox(
        width: 22,
        height: 22,
        child: CircularProgressIndicator(strokeWidth: 2.4, color: Colors.white),
      )
          : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label),
          if (afficherFleche) ...[
            const SizedBox(width: 8),
            const Icon(LucideIcons.arrowRight, size: 18, color: Colors.white),
          ],
        ],
      ),
    );
  }
}