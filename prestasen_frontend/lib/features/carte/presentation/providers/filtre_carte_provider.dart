import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtre_carte_provider.g.dart';

@riverpod
class FiltreCarteNotifier extends _$FiltreCarteNotifier {
  @override
  String? build() => null;

  void changer(String? categorieId) => state = categorieId;
}