import 'package:url_launcher/url_launcher.dart';

class WhatsAppHelper {
  WhatsAppHelper._();

  static Future<bool> contacterPourService({
    required String telephoneProfessionnel,
    required String nomProfessionnel,
    required String besoin,
    required String dateSouhaitee,
  }) async {
    final message = 'Bonjour $nomProfessionnel, je vous contacte via Prestasen.\n\n'
        'Besoin : $besoin\n'
        'Date souhaitée : $dateSouhaitee';

    return _ouvrirWhatsApp(telephoneProfessionnel, message);
  }

  static Future<bool> contacterPourProduit({
    required String telephoneProfessionnel,
    required String nomProfessionnel,
    required String nomProduit,
    required int quantite,
    String? precision,
  }) async {
    final buffer = StringBuffer()
      ..writeln('Bonjour $nomProfessionnel, je vous contacte via Prestasen.')
      ..writeln()
      ..writeln('Produit : $nomProduit')
      ..writeln('Quantité : $quantite');

    if (precision != null && precision.trim().isNotEmpty) {
      buffer.writeln('Précision : $precision');
    }

    return _ouvrirWhatsApp(telephoneProfessionnel, buffer.toString());
  }

  static Future<bool> contacterDirectement({
    required String telephoneProfessionnel,
    required String nomProfessionnel,
  }) async {
    final message = 'Bonjour $nomProfessionnel, je vous contacte via Prestasen.';
    return _ouvrirWhatsApp(telephoneProfessionnel, message);
  }

  static Future<bool> _ouvrirWhatsApp(String telephone, String message) async {
    final telephoneNettoye = telephone.replaceAll(RegExp(r'[^\d+]'), '');
    final messageEncode = Uri.encodeComponent(message);
    final uri = Uri.parse('https://wa.me/$telephoneNettoye?text=$messageEncode');

    try {
      return await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      return false;
    }
  }
}