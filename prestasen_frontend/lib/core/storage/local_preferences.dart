import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  final SharedPreferences _prefs;

  LocalPreferences(this._prefs);

  static const _onboardingVuKey = 'onboarding_vu';
  static const _regionParDefautKey = 'region_par_defaut';

  bool get onboardingVu => _prefs.getBool(_onboardingVuKey) ?? false;
  Future<void> setOnboardingVu(bool vu) => _prefs.setBool(_onboardingVuKey, vu);

  String? get regionParDefaut => _prefs.getString(_regionParDefautKey);
  Future<void> setRegionParDefaut(String region) => _prefs.setString(_regionParDefautKey, region);
}