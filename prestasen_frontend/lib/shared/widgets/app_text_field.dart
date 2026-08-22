import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class AppTextField extends StatefulWidget {
  final String label;
  final String? hint;
  final IconData icon;
  final TextEditingController controller;
  final bool motDePasse;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final bool autoCorrect;
  final ValueChanged<String>? onChanged;

  const AppTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    this.hint,
    this.motDePasse = false,
    this.keyboardType,
    this.validator,
    this.autoCorrect = true,
    this.onChanged,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _motDePasseVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: AppSizes.sm),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.motDePasse && !_motDePasseVisible,
          keyboardType: widget.keyboardType,
          autocorrect: widget.autoCorrect,
          validator: widget.validator,
          onChanged: widget.onChanged,
          style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(14),
              child: Icon(widget.icon, size: 20, color: AppColors.textSecondary),
            ),
            suffixIcon: widget.motDePasse
                ? IconButton(
              onPressed: () => setState(() => _motDePasseVisible = !_motDePasseVisible),
              icon: Icon(
                _motDePasseVisible ? LucideIcons.eyeOff : LucideIcons.eye,
                size: 20,
                color: AppColors.textSecondary,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}