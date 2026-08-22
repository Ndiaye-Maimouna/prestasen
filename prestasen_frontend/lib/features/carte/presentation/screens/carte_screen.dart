import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/config/regions_senegal.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/utils/icone_categorie.dart';
import '../../../../core/utils/price_formatter.dart';
import '../../../../shared/widgets/category_chip_list.dart';
import '../../../categories/data/providers/categorie_providers.dart';
import '../../../services/data/models/service_carte_point_model.dart';
import '../providers/carte_providers.dart';
import '../providers/filtre_carte_provider.dart';

class CarteScreen extends ConsumerStatefulWidget {
  const CarteScreen({super.key});

  @override
  ConsumerState<CarteScreen> createState() => _CarteScreenState();
}

class _CarteScreenState extends ConsumerState<CarteScreen> {
  final _mapController = MapController();
  List<ServiceCartePointModel> _points = [];
  bool _chargementInitial = true;
  String? _regionUtilisateur;
  double _zoomActuel = 7;


  static const double _senegalLatMin = 12.0;
  static const double _senegalLatMax = 16.7;
  static const double _senegalLngMin = -17.6;
  static const double _senegalLngMax = -11.3;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _initialiser());
  }

  Future<void> _initialiser() async {
    final region = await ref.read(regionUtilisateurCarteProvider.future);
    if (!mounted) return;

    _regionUtilisateur = region;
    _centrerSurRegion(region);
    setState(() => _chargementInitial = false);

    await _chargerPoints();
  }

  void _centrerSurRegion(String? region) {
    final coordonnees = RegionsSenegal.coordonneesPour(region);
    final zoom = region != null ? 10.0 : 7.0;
    _mapController.move(coordonnees, zoom);
  }

  Future<void> _chargerPoints() async {
    if (!mounted) return;
    final categorieId = ref.read(filtreCarteNotifierProvider);

    try {
      final points = await ref.read(pointsCarteServicesProvider(
        latMin: _senegalLatMin, latMax: _senegalLatMax, lngMin: _senegalLngMin, lngMax: _senegalLngMax,
        categorieId: categorieId,
      ).future);
      if (!mounted) return;
      setState(() => _points = points);
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible de charger les services sur la carte')),
      );
    }
  }

  void _ouvrirApercu(ServiceCartePointModel point) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _ApercuService(point: point),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoriesAsync = ref.watch(categoriesDisponiblesProvider);
    final categorieSelectionnee = ref.watch(filtreCarteNotifierProvider);
    final afficherLabels = _zoomActuel >= 13;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: const LatLng(14.4974, -14.4524),
              initialZoom: 7,
              onMapEvent: (event) {
                final zoom = _mapController.camera.zoom;
                if ((zoom - _zoomActuel).abs() > 0.3) {
                  setState(() => _zoomActuel = zoom);
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'sn.prestasen.app',
              ),
              MarkerClusterLayerWidget(
                options: MarkerClusterLayerOptions(
                  maxClusterRadius: 50,
                  size: Size(afficherLabels ? 130 : 42, afficherLabels ? 66 : 42),
                  markers: _points
                      .map((point) => Marker(
                    point: LatLng(point.latitude, point.longitude),
                    width: afficherLabels ? 130 : 40,
                    height: afficherLabels ? 66 : 40,
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () => _ouvrirApercu(point),
                      child: _MarqueurService(
                        icone: iconePourCategorie(point.categorieIcone),
                        titre: point.titre,
                        afficherLabel: afficherLabels,
                      ),
                    ),
                  ))
                      .toList(),
                  builder: (context, marqueurs) => _BulleCluster(nombre: marqueurs.length),
                ),
              ),
              RichAttributionWidget(
                attributions: [TextSourceAttribution('© OpenStreetMap contributors', onTap: () {})],
              ),
            ],
          ),

          if (_chargementInitial)
            Container(
              color: AppColors.background,
              child: const Center(child: CircularProgressIndicator(color: AppColors.primary)),
            ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: categoriesAsync.when(
                data: (categories) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 12, offset: const Offset(0, 4))],
                  ),
                  child: CategoryChipList(
                    categories: categories,
                    categorieSelectionneeId: categorieSelectionnee,
                    onSelectionChanged: (id) {
                      ref.read(filtreCarteNotifierProvider.notifier).changer(id);
                      _chargerPoints();
                    },
                  ),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ),
          ),

          if (!_chargementInitial)
            Positioned(
              bottom: 100,
              left: AppSizes.md,
              right: AppSizes.md,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 10)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(LucideIcons.wrench, size: 14, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      '${_points.length} service(s) au total',
                      style: const TextStyle(fontSize: 12.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
                    ),
                  ],
                ),
              ),
            ),

          Positioned(
            right: AppSizes.md,
            bottom: AppSizes.xl,
            child: FloatingActionButton(
              backgroundColor: AppColors.surface,
              foregroundColor: AppColors.primary,
              onPressed: () => _centrerSurRegion(_regionUtilisateur),
              child: const Icon(LucideIcons.locateFixed),
            ),
          ),
        ],
      ),
    );
  }
}

class _MarqueurService extends StatelessWidget {
  final IconData icone;
  final String titre;
  final bool afficherLabel;

  const _MarqueurService({required this.icone, required this.titre, required this.afficherLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (afficherLabel)
          Container(
            margin: const EdgeInsets.only(bottom: 4),
            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
            constraints: const BoxConstraints(maxWidth: 120),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 4)],
            ),
            child: Text(
              titre,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 10.5, fontWeight: FontWeight.w600, color: AppColors.textPrimary),
            ),
          ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2.5),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.15), blurRadius: 6)],
          ),
          child: Icon(icone, color: Colors.white, size: 16),
        ),
      ],
    );
  }
}

class _BulleCluster extends StatelessWidget {
  final int nombre;
  const _BulleCluster({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.primaryDark, shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 3)),
      alignment: Alignment.center,
      child: Text('$nombre', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
    );
  }
}

class _ApercuService extends StatelessWidget {
  final ServiceCartePointModel point;
  const _ApercuService({required this.point});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.lg),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg + 4)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                child: point.image != null
                    ? CachedNetworkImage(imageUrl: point.image!, width: 64, height: 64, fit: BoxFit.cover)
                    : Container(
                  width: 64,
                  height: 64,
                  color: AppColors.mint50,
                  alignment: Alignment.center,
                  child: const Icon(LucideIcons.image, color: AppColors.primaryLight),
                ),
              ),
              const SizedBox(width: AppSizes.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(point.titre, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 2),
                    Text(point.professionnelNom, style: const TextStyle(fontSize: 12.5, color: AppColors.textSecondary)),
                    const SizedBox(height: 4),
                    Text(PriceFormatter.formatIndicatif(point.prixIndicatif),
                        style: const TextStyle(fontSize: 13.5, fontWeight: FontWeight.w700, color: AppColors.primaryDark)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSizes.lg),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.push('/services/${point.id}');
            },
            child: const Text('Voir le détail'),
          ),
        ],
      ),
    );
  }
}