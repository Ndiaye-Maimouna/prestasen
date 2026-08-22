class PhoneFormatter {
  PhoneFormatter._();

  static const _indicatifSenegal = '+221';

  static String normaliser(String saisie) {
    var nettoye = saisie.replaceAll(RegExp(r'[\s-]'), '');

    if (nettoye.startsWith('00221')) {
      nettoye = '+221${nettoye.substring(5)}';
    } else if (nettoye.startsWith('221') && !nettoye.startsWith('+221')) {
      nettoye = '+$nettoye';
    } else if (!nettoye.startsWith('+221')) {
      nettoye = '$_indicatifSenegal$nettoye';
    }

    return nettoye;
  }

  static bool estValide(String telephone) {
    final normalise = normaliser(telephone);
    return RegExp(r'^\+221[0-9]{9}$').hasMatch(normalise);
  }

  static String formaterPourAffichage(String telephone) {
    final normalise = normaliser(telephone);
    if (normalise.length != 13) return telephone;

    final indicatif = normalise.substring(0, 4);
    final reste = normalise.substring(4);
    return '$indicatif ${reste.substring(0, 2)} ${reste.substring(2, 5)} ${reste.substring(5, 7)} ${reste.substring(7, 9)}';
  }
}