import 'package:flutter/widgets.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

IconData iconePourCategorie(String? icone) {
  switch (icone) {
    case 'plomberie':
      return LucideIcons.wrench;
    case 'electricite':
      return LucideIcons.zap;
    case 'menuiserie':
      return LucideIcons.hammer;
    case 'developpement':
      return LucideIcons.code;
    case 'graphisme':
      return LucideIcons.palette;
    case 'couture':
      return LucideIcons.scissors;
    case 'patisserie':
      return LucideIcons.cakeSlice;
    case 'bijoux':
      return LucideIcons.gem;
    case 'produits_locaux':
      return LucideIcons.leaf;
    case 'serigraphie':
      return LucideIcons.shirt;
    default:
      return LucideIcons.tag;
  }
}