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
import '../../data/providers/utilisateur_providers.dart';

class ChangerMotDePasseScreen extends ConsumerStatefulWidget {
  const ChangerMotDePasseScreen({super.key});

  @override
  ConsumerState<ChangerMotDePasseScreen> createState() => _ChangerMotDePasseScreenState();
}

class _ChangerMotDePasseScreenState extends ConsumerState<ChangerMotDePasseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ancienController = TextEditingController();
  final _nouveauController = TextEditingController();
  final _confirmationController = TextEditingController();
  bool _envoiEnCours = false;

  @override
  void dispose() {
    _ancienController.dispose();
    _nouveauController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  Future<void> _soumettre() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _envoiEnCours = true);
    try {
      await ref.read(utilisateurRepositoryProvider).changerMotDePasse(
        ancienMotDePasse: _ancienController.text,
        nouveauMotDePasse: _nouveauController.text,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Mot de passe modifié avec succès'), backgroundColor: AppColors.success),
        );
        context.pop();
      }
    } catch (e) {
      final failure = e as Failure;
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(failure.messageAffichable), backgroundColor: AppColors.error),
        );
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
        title: const Text('Changer le mot de passe'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.lg),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppTextField(
                label: 'Mot de passe actuel',
                icon: LucideIcons.lock,
                controller: _ancienController,
                motDePasse: true,
                validator: (v) => (v == null || v.isEmpty) ? 'Requis' : null,
              ),
              const SizedBox(height: AppSizes.md),
              AppTextField(
                label: 'Nouveau mot de passe',
                icon: LucideIcons.lock,
                controller: _nouveauController,
                motDePasse: true,
                onChanged: (_) => setState(() {}),
                validator: PasswordValidator.valider,
              ),
              const SizedBox(height: AppSizes.xs),
              PasswordStrengthHint(motDePasse: _nouveauController.text),
              const SizedBox(height: AppSizes.md),
              AppTextField(
                label: 'Confirmer le nouveau mot de passe',
                icon: LucideIcons.lock,
                controller: _confirmationController,
                motDePasse: true,
                validator: (v) => PasswordValidator.validerConfirmation(v, _nouveauController.text),
              ),
              const SizedBox(height: AppSizes.xl),
              PrimaryButton(
                label: 'Confirmer',
                chargement: _envoiEnCours,
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