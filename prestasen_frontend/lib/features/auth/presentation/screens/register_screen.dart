import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/config/regions_senegal.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/password_validator.dart';
import '../../../../core/utils/phone_formatter.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/password_strength_hint.dart';
import '../../../../shared/widgets/phone_input_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../../../../shared/widgets/role_selector.dart';
import '../controllers/auth_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _prenomController = TextEditingController();
  final _nomController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _motDePasseController = TextEditingController();
  final _emailController = TextEditingController();
  final _confirmationMotDePasseController = TextEditingController();

  RoleChoix _role = RoleChoix.client;

  String? _region;

  @override
  void dispose() {
    _prenomController.dispose();
    _nomController.dispose();
    _telephoneController.dispose();
    _motDePasseController.dispose();
    _emailController.dispose();
    _confirmationMotDePasseController.dispose();
    super.dispose();
  }

  Future<void> _choisirRegion() async {
    final choix = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg)),
      ),
      builder: (context) => SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: RegionsSenegal.liste.map((region) {
            return ListTile(
              title: Text(region),
              trailing: region == _region ? const Icon(LucideIcons.check, color: AppColors.primary) : null,
              onTap: () => Navigator.pop(context, region),
            );
          }).toList(),
        ),
      ),
    );
    if (choix != null) setState(() => _region = choix);
  }

  void _soumettre() {
    if (!_formKey.currentState!.validate()) return;

    final telephone = PhoneFormatter.normaliser(_telephoneController.text);
    ref.read(authControllerProvider.notifier).inscrire(
      telephone: telephone,
      motDePasse: _motDePasseController.text,
      prenom: _prenomController.text.trim(),
      nom: _nomController.text.trim(),
      role: _role,
      email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
      region: _region, // ajouté
    );
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          if (previous is AsyncLoading) context.go('/accueil');
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
              Text('Créer un compte', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 6),
              Text(
                'Rejoignez la communauté Prestasen en quelques secondes',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.lg),

              RoleSelector(
                selection: _role,
                onChanged: (valeur) => setState(() => _role = valeur),
              ),
              const SizedBox(height: AppSizes.md),

              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      label: 'Prénom',
                      icon: LucideIcons.user,
                      controller: _prenomController,
                      validator: (value) =>
                      (value == null || value.trim().isEmpty) ? 'Requis' : null,
                    ),
                  ),
                  const SizedBox(width: AppSizes.sm),
                  Expanded(
                    child: AppTextField(
                      label: 'Nom',
                      icon: LucideIcons.user,
                      controller: _nomController,
                      validator: (value) =>
                      (value == null || value.trim().isEmpty) ? 'Requis' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSizes.md),

              PhoneInputField(
                controller: _telephoneController,
                validator: (value) {
                  if (value == null || value.length < 9) return 'Numéro invalide';
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.md),

              AppTextField(
                label: 'Mot de passe',
                icon: LucideIcons.lock,
                controller: _motDePasseController,
                motDePasse: true,
                validator: PasswordValidator.valider,
                onChanged: (_) => setState(() {}),
              ),
              const SizedBox(height: AppSizes.xs),
              PasswordStrengthHint(motDePasse: _motDePasseController.text),
              const SizedBox(height: AppSizes.md),

              AppTextField(
                label: 'Confirmer le mot de passe',
                icon: LucideIcons.lock,
                controller: _confirmationMotDePasseController,
                motDePasse: true,
                validator: (v) => PasswordValidator.validerConfirmation(v, _motDePasseController.text),
              ),

              AppTextField(
                label: 'Email (optionnel)',
                icon: LucideIcons.mail,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autoCorrect: false,
              ),
              const SizedBox(height: AppSizes.xl),

              const SizedBox(height: AppSizes.md),

              const Text('Région', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
              const SizedBox(height: AppSizes.sm),
              GestureDetector(
                onTap: _choisirRegion,
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
                      Expanded(child: Text(_region ?? 'Choisir votre région (optionnel)')),
                      const Icon(LucideIcons.chevronDown, size: 18, color: AppColors.textSecondary),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: 'Créer mon compte',
                chargement: authState.isLoading,
                onPressed: _soumettre,
              ),
            ],
          ),
        ),
      ),
    );
  }
}