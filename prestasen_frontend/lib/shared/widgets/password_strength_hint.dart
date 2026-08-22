import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class PasswordStrengthHint extends StatelessWidget {
  final String motDePasse;
  const PasswordStrengthHint({super.key, required this.motDePasse});

  bool get _aMajuscule => motDePasse.contains(RegExp(r'[A-Z]'));
  bool get _aMinuscule => motDePasse.contains(RegExp(r'[a-z]'));
  bool get _aChiffre => motDePasse.contains(RegExp(r'\d'));
  bool get _aLongueur => motDePasse.length >= 8;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 4,
      children: [
        _critere('8+ caractères', _aLongueur),
        _critere('Majuscule', _aMajuscule),
        _critere('Minuscule', _aMinuscule),
        _critere('Chiffre', _aChiffre),
      ],
    );
  }

  Widget _critere(String label, bool valide) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          valide ? Icons.check_circle : Icons.circle_outlined,
          size: 14,
          color: valide ? AppColors.success : AppColors.textDisabled,
        ),
        const SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 11.5, color: valide ? AppColors.success : AppColors.textDisabled)),
      ],
    );
  }
}