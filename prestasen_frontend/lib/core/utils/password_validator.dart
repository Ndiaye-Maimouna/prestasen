class PasswordValidator {
  PasswordValidator._();

  static final _regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');

  static String? valider(String? valeur) {
    if (valeur == null || valeur.isEmpty) return 'Mot de passe requis';
    if (!_regex.hasMatch(valeur)) {
      return 'Au moins 8 caractères, une majuscule, une minuscule et un chiffre';
    }
    return null;
  }

  static String? validerConfirmation(String? valeur, String motDePasseOriginal) {
    if (valeur != motDePasseOriginal) return 'Les mots de passe ne correspondent pas';
    return null;
  }
}