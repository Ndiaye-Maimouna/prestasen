import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../location/location_service.dart';
import '../storage/local_preferences.dart';

part 'core_providers.g.dart';

@Riverpod(keepAlive: true)
LocationService locationService(LocationServiceRef ref) {
  return LocationService();
}

@Riverpod(keepAlive: true)
LocalPreferences localPreferences(LocalPreferencesRef ref) {
  throw UnimplementedError('Doit être surchargé dans main.dart via ProviderScope(overrides: ...)');
}