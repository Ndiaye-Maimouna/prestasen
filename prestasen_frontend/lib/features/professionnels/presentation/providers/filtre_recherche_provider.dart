import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtre_recherche_provider.g.dart';

class FiltreRecherche {
  final String? categorieId;
  final String? region;
  final String motCle;

  const FiltreRecherche({this.categorieId, this.region, this.motCle = ''});

  FiltreRecherche copyWith({
    String? categorieId,
    bool resetCategorie = false,
    String? region,
    bool resetRegion = false,
    String? motCle,
  }) {
    return FiltreRecherche(
      categorieId: resetCategorie ? null : (categorieId ?? this.categorieId),
      region: resetRegion ? null : (region ?? this.region),
      motCle: motCle ?? this.motCle,
    );
  }
}

@riverpod
class FiltreRechercheNotifier extends _$FiltreRechercheNotifier {
  @override
  FiltreRecherche build() => const FiltreRecherche();

  void changerCategorie(String? categorieId) {
    state = categorieId == null
        ? state.copyWith(resetCategorie: true)
        : state.copyWith(categorieId: categorieId);
  }

  void changerRegion(String? region) {
    state = region == null ? state.copyWith(resetRegion: true) : state.copyWith(region: region);
  }

  void changerMotCle(String motCle) {
    state = state.copyWith(motCle: motCle);
  }
}