import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/screens/verification_otp_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/profil/presentation/screens/changer_mot_de_passe_screen.dart';
import '../network/network_providers.dart';
import 'go_router_refresh_stream.dart';
import 'main_shell.dart';

import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/auth/presentation/screens/mot_de_passe_oublie_screen.dart';
import '../../features/auth/presentation/screens/nouveau_mot_de_passe_screen.dart';

import '../../features/accueil/presentation/screens/accueil_screen.dart';
import '../../features/professionnels/presentation/screens/recherche_screen.dart';
import '../../features/carte/presentation/screens/carte_screen.dart';
import '../../features/profil/presentation/screens/mon_profil_screen.dart';

import '../../features/professionnels/presentation/screens/profil_professionnel_screen.dart';
import '../../features/services/presentation/screens/service_detail_screen.dart';
import '../../features/produits/presentation/screens/produit_detail_screen.dart';

import '../../features/profil/presentation/screens/mes_annonces_screen.dart';
import '../../features/services/presentation/screens/service_form_screen.dart';
import '../../features/produits/presentation/screens/produit_form_screen.dart';
import '../../features/professionnels/presentation/screens/profil_professionnel_edit_screen.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(AppRouterRef ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  final authEventBus = ref.watch(authEventBusProvider);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: GoRouterRefreshStream(authEventBus.onSessionExpiree),
    redirect: (context, state) async {
      final estSurSplash = state.matchedLocation == '/splash';
      final estSurAuth = state.matchedLocation.startsWith('/auth');

      final aUneSession = await tokenStorage.hasValidSession();

      if (estSurSplash) return null;
      if (!aUneSession && !estSurAuth) return '/auth/login';
      if (aUneSession && estSurAuth) return '/accueil';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),

      // Auth
      GoRoute(path: '/auth/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/auth/register', builder: (context, state) => const RegisterScreen()),
      GoRoute(
        path: '/auth/mot-de-passe-oublie',
        builder: (context, state) => const MotDePasseOublieScreen(),
      ),
      GoRoute(
        path: '/auth/mot-de-passe-oublie',
        builder: (context, state) => const MotDePasseOublieScreen(),
      ),
      GoRoute(
        path: '/auth/verification-otp',
        builder: (context, state) => VerificationOtpScreen(telephone: state.extra as String),
      ),
      GoRoute(
        path: '/auth/nouveau-mot-de-passe',
        builder: (context, state) {
          final data = state.extra as Map<String, String>;
          return NouveauMotDePasseScreen(telephone: data['telephone']!, code: data['code']!);
        },
      ),

      // Shell principal (bottom nav)
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(path: '/accueil', builder: (context, state) => const AccueilScreen()),
          GoRoute(path: '/recherche', builder: (context, state) => RechercheScreen(categorieInitiale: state.extra as String?),),
          GoRoute(path: '/carte', builder: (context, state) => const CarteScreen()),
          GoRoute(path: '/profil', builder: (context, state) => const MonProfilScreen()),
        ],
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),

      // Détail profil professionnel
      GoRoute(
        path: '/professionnels/:id',
        builder: (context, state) => ProfilProfessionnelScreen(
          professionnelId: state.pathParameters['id']!,
        ),
      ),

      // Détail service / produit
      GoRoute(
        path: '/services/:id',
        builder: (context, state) => ServiceDetailScreen(
          serviceId: state.pathParameters['id']!,
          masquerNavigationProfessionnel: state.uri.queryParameters['depuisProfil'] == 'true',
        ),
      ),
      GoRoute(
        path: '/produits/:id',
        builder: (context, state) => ProduitDetailScreen(
          produitId: state.pathParameters['id']!,
          masquerNavigationProfessionnel: state.uri.queryParameters['depuisProfil'] == 'true',
        ),
      ),

      // Gestion de mes annonces (côté professionnel)
      GoRoute(path: '/mes-annonces', builder: (context, state) => const MesAnnoncesScreen()),
      GoRoute(
        path: '/mes-annonces/service/nouveau',
        builder: (context, state) => const ServiceFormScreen(),
      ),
      GoRoute(
        path: '/mes-annonces/service/:id/editer',
        builder: (context, state) => ServiceFormScreen(serviceId: state.pathParameters['id']),
      ),
      GoRoute(
        path: '/mes-annonces/produit/nouveau',
        builder: (context, state) => const ProduitFormScreen(),
      ),
      GoRoute(
        path: '/mes-annonces/produit/:id/editer',
        builder: (context, state) => ProduitFormScreen(produitId: state.pathParameters['id']),
      ),

      // Profil / paramètres
      GoRoute(
        path: '/profil-professionnel/editer',
        builder: (context, state) => const ProfilProfessionnelEditScreen(),
      ),
      GoRoute(
        path: '/profil/changer-mot-de-passe',
        builder: (context, state) => const ChangerMotDePasseScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page introuvable : ${state.uri}')),
    ),
  );
}