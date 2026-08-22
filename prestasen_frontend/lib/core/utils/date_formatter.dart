import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter._();

  static String relative(DateTime date) {
    final maintenant = DateTime.now();
    final difference = maintenant.difference(date);

    if (difference.inMinutes < 1) return 'À l\'instant';
    if (difference.inMinutes < 60) return 'Il y a ${difference.inMinutes} min';
    if (difference.inHours < 24) return 'Il y a ${difference.inHours} h';
    if (difference.inDays < 7) return 'Il y a ${difference.inDays} j';

    return DateFormat('d MMM yyyy', 'fr_FR').format(date);
  }

  static String complete(DateTime date) {
    return DateFormat('d MMMM yyyy', 'fr_FR').format(date);
  }
}