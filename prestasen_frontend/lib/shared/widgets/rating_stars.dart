import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../core/constants/app_colors.dart';

class RatingStars extends StatelessWidget {
  final double note;
  final int? nombreAvis;
  final double taille;

  const RatingStars({
    super.key,
    required this.note,
    this.nombreAvis,
    this.taille = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: note,
          itemCount: 5,
          itemSize: taille,
          unratedColor: AppColors.border,
          itemBuilder: (context, _) => const Icon(Icons.star_rounded, color: AppColors.etoile),
        ),
        const SizedBox(width: 6),
        Text(
          note.toStringAsFixed(1),
          style: TextStyle(fontSize: taille * 0.75, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
        ),
        if (nombreAvis != null) ...[
          const SizedBox(width: 4),
          Text(
            '($nombreAvis)',
            style: TextStyle(fontSize: taille * 0.7, color: AppColors.textSecondary),
          ),
        ],
      ],
    );
  }
}