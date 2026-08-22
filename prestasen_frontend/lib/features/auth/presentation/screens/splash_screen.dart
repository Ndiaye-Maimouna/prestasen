import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/network/network_providers.dart';
import '../../../../core/notifications/push_notification_service.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _verifierSessionEtRediriger();
  }

  Future<void> _verifierSessionEtRediriger() async {
    final debut = DateTime.now();
    final tokenStorage = ref.read(tokenStorageProvider);
    final aUneSession = await tokenStorage.hasValidSession();

    final ecoule = DateTime.now().difference(debut);
    final attenteRestante = const Duration(milliseconds: 900) - ecoule;
    if (attenteRestante > Duration.zero) {
      await Future.delayed(attenteRestante);
    }

    if (aUneSession) {
      await ref.read(pushNotificationServiceProvider).initialiser();
    }

    if (!mounted) return;
    context.go(aUneSession ? '/accueil' : '/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(
          'assets/logo/logo_white.svg',
          width: 160,
        ),
      ),
    );
  }
}