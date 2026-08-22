import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/password_validator.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/password_strength_hint.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class NouveauMotDePasseScreen extends ConsumerStatefulWidget {
  final String telephone;
  final String code;

  const NouveauMotDePasseScreen({super.key, required this.telephone, required this.code});

  @override
  ConsumerState<NouveauMotDePasseScreen> createState() => _NouveauMotDePasseScreenState();
}

class _NouveauMotDePasseScreenState extends ConsumerState<NouveauMotDePasseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _motDePasseController = TextEditingController();
  final _confirmationController = TextEditingController();

  void _soumettre() {
    if (!_formKey.currentState!.validate()) return;

    ref.read(authControllerProvider.notifier).reinitialiserMotDePasse(
      telephone: widget.telephone,
      code: widget.code,
      nouveauMotDePasse: _motDePasseController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          if (previous is AsyncLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Mot de passe réinitialisé, connectez-vous'), backgroundColor: AppColors.success),
            );
            context.go('/auth/login');
          }
        },
        error: (error, _) {
          final failure = error as Failure;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(failure.messageAffichable), backgroundColor: AppColors.error),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.go('/auth/login'),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, 0, AppSizes.lg, AppSizes.xl),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nouveau mot de passe', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 6),
              Text('Choisissez un mot de passe sécurisé', style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: AppSizes.xl),

              AppTextField(
                label: 'Nouveau mot de passe',
                icon: LucideIcons.lock,
                controller: _motDePasseController,
                motDePasse: true,
                onChanged: (_) => setState(() {}),
                validator: PasswordValidator.valider,
              ),
              const SizedBox(height: AppSizes.xs),
              PasswordStrengthHint(motDePasse: _motDePasseController.text),
              const SizedBox(height: AppSizes.md),

              AppTextField(
                label: 'Confirmer le mot de passe',
                icon: LucideIcons.lock,
                controller: _confirmationController,
                motDePasse: true,
                validator: (v) => PasswordValidator.validerConfirmation(v, _motDePasseController.text),
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: 'Réinitialiser le mot de passe',
                chargement: authState.isLoading,
                afficherFleche: false,
                onPressed: _soumettre,
              ),
            ],
          ),
        ),
      ),
    );
  }
}