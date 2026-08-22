import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/phone_formatter.dart';
import '../../../../shared/widgets/app_text_field.dart';
import '../../../../shared/widgets/auth_header.dart';
import '../../../../shared/widgets/phone_input_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _telephoneController = TextEditingController();
  final _motDePasseController = TextEditingController();

  @override
  void dispose() {
    _telephoneController.dispose();
    _motDePasseController.dispose();
    super.dispose();
  }

  void _soumettre() {
    if (!_formKey.currentState!.validate()) return;

    final telephone = PhoneFormatter.normaliser(_telephoneController.text);
    ref.read(authControllerProvider.notifier).connecter(
      telephone: telephone,
      motDePasse: _motDePasseController.text,
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
          final message = failure.maybeWhen(
            unauthorized: (_) => 'Numéro de téléphone ou mot de passe incorrect',
            orElse: () => failure.messageAffichable,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message), backgroundColor: AppColors.error),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthHeader(),
            Padding(
              padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.lg, AppSizes.lg, AppSizes.xl),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Content de vous revoir', style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 6),
                    Text(
                      'Connectez-vous pour retrouver les prestataires près de chez vous',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: AppSizes.xl),

                    PhoneInputField(
                      controller: _telephoneController,
                      validator: (value) {
                        if (value == null || value.length < 9) {
                          return 'Numéro invalide';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppSizes.md),

                    AppTextField(
                      label: 'Mot de passe',
                      icon: LucideIcons.lock,
                      controller: _motDePasseController,
                      motDePasse: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) return 'Mot de passe requis';
                        return null;
                      },
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context.go('/auth/mot-de-passe-oublie'),
                        child: const Text('Mot de passe oublié ?'),
                      ),
                    ),
                    const SizedBox(height: AppSizes.sm),

                    PrimaryButton(
                      label: 'Se connecter',
                      chargement: authState.isLoading,
                      onPressed: _soumettre,
                    ),

                    const SizedBox(height: AppSizes.lg),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Pas encore de compte ?", style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                          onPressed: () => context.go('/auth/register'),
                          child: const Text('Créer un compte'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}