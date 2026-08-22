import 'package:intl/intl.dart';

class PriceFormatter {
  PriceFormatter._();

  static final _formatter = NumberFormat.currency(
    locale: 'fr_SN',
    symbol: 'FCFA',
    decimalDigits: 0,
    customPattern: '#,##0 ¤',
  );

  static String format(double prix) => _formatter.format(prix);

  static String formatIndicatif(double? prix) {
    if (prix == null) return 'Prix sur devis';
    return format(prix);
  }
}