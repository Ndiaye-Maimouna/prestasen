import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/phone_formatter.dart';
import '../../../../shared/widgets/phone_input_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class MotDePasseOublieScreen extends ConsumerStatefulWidget {
  const MotDePasseOublieScreen({super.key});

  @override
  ConsumerState<MotDePasseOublieScreen> createState() => _MotDePasseOublieScreenState();
}

class _MotDePasseOublieScreenState extends ConsumerState<MotDePasseOublieScreen> {
  final _formKey = GlobalKey<FormState>();
  final _telephoneController = TextEditingController();

  @override
  void dispose() {
    _telephoneController.dispose();
    super.dispose();
  }

  void _soumettre() {
    if (!_formKey.currentState!.validate()) return;
    ref.read(authControllerProvider.notifier)
        .demanderReinitialisation(PhoneFormatter.normaliser(_telephoneController.text));
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          if (previous is AsyncLoading) {
            context.go('/auth/verification-otp', extra: PhoneFormatter.normaliser(_telephoneController.text));
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
              Container(
                width: 64,
                height: 64,
                decoration: const BoxDecoration(color: AppColors.mint50, shape: BoxShape.circle),
                child: const Center(child: Icon(LucideIcons.lock, size: 28, color: AppColors.primary)),
              ),
              const SizedBox(height: AppSizes.lg),
              Text('Mot de passe oublié ?', style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 6),
              Text(
                'Entrez votre numéro de téléphone, nous vous enverrons un code de vérification par SMS',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSizes.xl),

              PhoneInputField(
                controller: _telephoneController,
                validator: (value) {
                  if (value == null || value.length < 9) return 'Numéro invalide';
                  return null;
                },
              ),
              const SizedBox(height: AppSizes.xl),

              PrimaryButton(
                label: 'Envoyer le code',
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