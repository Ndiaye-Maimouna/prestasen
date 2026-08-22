import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../core/config/regions_senegal.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/phone_formatter.dart';
import '../../../auth/data/models/role.dart';
import '../../../auth/presentation/controllers/auth_controller.dart';
import '../providers/mon_profil_presentation_providers.dart';
import '../../data/providers/utilisateur_providers.dart';

class MonProfilScreen extends ConsumerStatefulWidget {
  const MonProfilScreen({super.key});

  @override
  ConsumerState<MonProfilScreen> createState() => _MonProfilScreenState();
}

class _MonProfilScreenState extends ConsumerState<MonProfilScreen> {
  bool _modeEdition = false;
  bool _envoiEnCours = false;
  bool _champsInitialises = false;

  final _prenomController = TextEditingController();
  final _nomController = TextEditingController();
  final _emailController = TextEditingController();
  String? _region;

  void _initialiserChamps(utilisateur) {
    if (_champsInitialises) return;
    _prenomController.text = utilisateur.prenom;
    _nomController.text = utilisateur.nom;
    _emailController.text = utilisateur.email ?? '';
    _region = utilisateur.region;
    _champsInitialises = true;
  }

  Future<void> _changerAvatar() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 82);
    if (image == null) return;

    try {
      await ref.read(utilisateurRepositoryProvider).mettreAJourAvatar(image);
      ref.invalidate(monUtilisateurProvider);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Échec de l\'envoi de la photo')));
      }
    }
  }

  Future<void> _enregistrer() async {
    setState(() => _envoiEnCours = true);
    try {
      await ref.read(utilisateurRepositoryProvider).mettreAJour(
        prenom: _prenomController.text.trim(),
        nom: _nomController.text.trim(),
        email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
        region: _region,
      );
      ref.invalidate(monUtilisateurProvider);
      if (mounted) setState(() => _modeEdition = false);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Échec de la mise à jour')));
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  Future<void> _seDeconnecter() async {
    final confirme = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Se déconnecter ?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annuler')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Déconnexion', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    if (confirme != true) return;

    final router = GoRouter.of(context);
    await ref.read(authControllerProvider.notifier).deconnecter();
    router.go('/auth/login');
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

  @override
  Widget build(BuildContext context) {
    final utilisateurAsync = ref.watch(monUtilisateurProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: utilisateurAsync.when(
          loading: () => const Center(child: CircularProgressIndicator(color: AppColors.primary)),
          error: (_, __) => const Center(child: Text('Impossible de charger le profil')),
          data: (utilisateur) {
            _initialiserChamps(utilisateur);

            return ListView(
              padding: const EdgeInsets.all(AppSizes.lg),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Mon profil', style: Theme.of(context).textTheme.headlineMedium),
                    TextButton.icon(
                      onPressed: () {
                        if (_modeEdition) {
                          _enregistrer();
                        } else {
                          setState(() => _modeEdition = true);
                        }
                      },
                      icon: Icon(_modeEdition ? LucideIcons.check : LucideIcons.pencil, size: 16),
                      label: Text(_modeEdition ? 'Enregistrer' : 'Modifier'),
                    ),
                  ],
                ),
                const SizedBox(height: AppSizes.md),

                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 96,
                        height: 96,
                        decoration: const BoxDecoration(color: AppColors.mint100, shape: BoxShape.circle),
                        child: ClipOval(
                          child: (utilisateur.photoUrl == null || utilisateur.photoUrl!.isEmpty)
                              ? Center(
                            child: Text(
                              utilisateur.prenom.isNotEmpty ? utilisateur.prenom[0].toUpperCase() : '?',
                              style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
                            ),
                          )
                              : CachedNetworkImage(imageUrl: utilisateur.photoUrl!, fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: _changerAvatar,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                              border: Border.fromBorderSide(BorderSide(color: AppColors.background, width: 3)),
                            ),
                            child: const Icon(LucideIcons.camera, size: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                Center(
                  child: Text(
                    PhoneFormatter.formaterPourAffichage(utilisateur.telephone),
                    style: const TextStyle(color: AppColors.textSecondary, fontSize: 13.5),
                  ),
                ),
                const SizedBox(height: AppSizes.xl),

                Container(
                  padding: const EdgeInsets.all(AppSizes.md),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    border: Border.all(color: AppColors.border),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_modeEdition) ...[
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _prenomController,
                                decoration: const InputDecoration(labelText: 'Prénom'),
                              ),
                            ),
                            const SizedBox(width: AppSizes.sm),
                            Expanded(
                              child: TextFormField(
                                controller: _nomController,
                                decoration: const InputDecoration(labelText: 'Nom'),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSizes.md),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(labelText: 'Email (optionnel)'),
                        ),
                        const SizedBox(height: AppSizes.md),
                        GestureDetector(
                          onTap: _choisirRegion,
                          child: Container(
                            height: 52,
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.md),
                            decoration: BoxDecoration(
                              color: AppColors.background,
                              borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                              border: Border.all(color: AppColors.border),
                            ),
                            child: Row(
                              children: [
                                Expanded(child: Text(_region ?? 'Choisir une région')),
                                const Icon(LucideIcons.chevronDown, size: 18, color: AppColors.textSecondary),
                              ],
                            ),
                          ),
                        ),
                        if (_envoiEnCours) ...[
                          const SizedBox(height: AppSizes.sm),
                          const LinearProgressIndicator(),
                        ],
                      ] else ...[
                        _LigneInfo(label: 'Prénom', valeur: utilisateur.prenom),
                        _LigneInfo(label: 'Nom', valeur: utilisateur.nom),
                        _LigneInfo(label: 'Email', valeur: utilisateur.email ?? 'Non renseigné'),
                        _LigneInfo(label: 'Région', valeur: utilisateur.region ?? 'Non renseignée'),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.lg),

                if (utilisateur.role == Role.professionnel) ...[
                  _CarteAction(
                    icon: LucideIcons.layoutGrid,
                    titre: 'Mes annonces',
                    sousTitre: 'Gérer vos services et produits publiés',
                    onTap: () => context.push('/mes-annonces'),
                  ),
                  const SizedBox(height: AppSizes.sm),
                  _CarteAction(
                    icon: LucideIcons.userCog,
                    titre: 'Profil professionnel',
                    sousTitre: 'Description, catégories, localisation',
                    onTap: () => context.push('/profil-professionnel/editer'),
                  ),
                  const SizedBox(height: AppSizes.sm),
                ],

                _CarteAction(
                  icon: LucideIcons.lock,
                  titre: 'Mot de passe',
                  sousTitre: 'Changer votre mot de passe',
                  onTap: () => context.push('/profil/changer-mot-de-passe'),
                ),

                const SizedBox(height: AppSizes.xl),
                OutlinedButton(
                  onPressed: _seDeconnecter,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.error,
                    side: const BorderSide(color: AppColors.error),
                  ),
                  child: const Text('Se déconnecter'),
                ),
                const SizedBox(height: AppSizes.xl),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _LigneInfo extends StatelessWidget {
  final String label;
  final String valeur;
  const _LigneInfo({required this.label, required this.valeur});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(label, style: const TextStyle(fontSize: 13, color: AppColors.textSecondary)),
          ),
          Expanded(
            child: Text(valeur, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}

class _CarteAction extends StatelessWidget {
  final IconData icon;
  final String titre;
  final String sousTitre;
  final VoidCallback onTap;

  const _CarteAction({required this.icon, required this.titre, required this.sousTitre, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
      child: Container(
        padding: const EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(color: AppColors.mint50, shape: BoxShape.circle),
              child: Icon(icon, size: 19, color: AppColors.primary),
            ),
            const SizedBox(width: AppSizes.sm),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(titre, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary)),
                  Text(sousTitre, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                ],
              ),
            ),
            const Icon(LucideIcons.chevronRight, size: 18, color: AppColors.textDisabled),
          ],
        ),
      ),
    );
  }
}