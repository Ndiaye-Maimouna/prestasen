import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/errors/failure.dart';
import '../../../../shared/widgets/otp_input_field.dart';
import '../../../../shared/widgets/primary_button.dart';
import '../controllers/auth_controller.dart';

class VerificationOtpScreen extends ConsumerStatefulWidget {
  final String telephone;

  const VerificationOtpScreen({super.key, required this.telephone});

  @override
  ConsumerState<VerificationOtpScreen> createState() => _VerificationOtpScreenState();
}

class _VerificationOtpScreenState extends ConsumerState<VerificationOtpScreen> {
  String _code = '';

  void _verifier() {
    if (_code.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Entrez le code complet à 6 chiffres')),
      );
      return;
    }
    ref.read(authControllerProvider.notifier).verifierOtp(telephone: widget.telephone, code: _code);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      next.whenOrNull(
        data: (_) {
          if (previous is AsyncLoading) {
            context.go(
              '/auth/nouveau-mot-de-passe',
              extra: {'telephone': widget.telephone, 'code': _code},
            );
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
          onPressed: () => context.go('/auth/mot-de-passe-oublie'),
          icon: const Icon(LucideIcons.chevronLeft, color: AppColors.textPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, 0, AppSizes.lg, AppSizes.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Vérification', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 6),
            Text(
              'Entrez le code reçu par SMS au +221 ${widget.telephone.substring(4)}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSizes.xl),

            OtpInputField(onChanged: (valeur) => _code = valeur),
            const SizedBox(height: AppSizes.lg),

            Center(
              child: TextButton(
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).demanderReinitialisation(widget.telephone),
                child: const Text('Renvoyer le code'),
              ),
            ),
            const SizedBox(height: AppSizes.md),

            PrimaryButton(
              label: 'Vérifier',
              chargement: authState.isLoading,
              afficherFleche: false,
              onPressed: _verifier,
            ),
          ],
        ),
      ),
    );
  }
}