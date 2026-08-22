import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/price_formatter.dart';
import '../../core/utils/whatsapp_helper.dart';
import 'primary_button.dart';
import 'quantity_stepper.dart';

class ContactProduitSheet extends StatefulWidget {
  final String telephoneProfessionnel;
  final String nomProfessionnel;
  final String nomProduit;
  final double prixUnitaire;

  const ContactProduitSheet({
    super.key,
    required this.telephoneProfessionnel,
    required this.nomProfessionnel,
    required this.nomProduit,
    required this.prixUnitaire,
  });

  static Future<void> afficher(
      BuildContext context, {
        required String telephoneProfessionnel,
        required String nomProfessionnel,
        required String nomProduit,
        required double prixUnitaire,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ContactProduitSheet(
        telephoneProfessionnel: telephoneProfessionnel,
        nomProfessionnel: nomProfessionnel,
        nomProduit: nomProduit,
        prixUnitaire: prixUnitaire,
      ),
    );
  }

  @override
  State<ContactProduitSheet> createState() => _ContactProduitSheetState();
}

class _ContactProduitSheetState extends State<ContactProduitSheet> {
  final _precisionController = TextEditingController();
  int _quantite = 1;

  @override
  void dispose() {
    _precisionController.dispose();
    super.dispose();
  }

  Future<void> _envoyer() async {
    final succes = await WhatsAppHelper.contacterPourProduit(
      telephoneProfessionnel: widget.telephoneProfessionnel,
      nomProfessionnel: widget.nomProfessionnel,
      nomProduit: widget.nomProduit,
      quantite: _quantite,
      precision: _precisionController.text.trim().isEmpty ? null : _precisionController.text.trim(),
    );
    if (!mounted) return;

    if (succes) {
      Navigator.of(context).pop();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Impossible d\'ouvrir WhatsApp. Vérifiez qu\'il est installé.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.prixUnitaire * _quantite;

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.radiusLg + 4)),
        ),
        padding: const EdgeInsets.fromLTRB(AppSizes.lg, AppSizes.sm, AppSizes.lg, AppSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: AppSizes.md),
                decoration: BoxDecoration(color: AppColors.border, borderRadius: BorderRadius.circular(2)),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(color: AppColors.mint50, shape: BoxShape.circle),
                  child: const Icon(LucideIcons.shoppingBag, size: 19, color: AppColors.primary),
                ),
                const SizedBox(width: AppSizes.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Commander', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      Text(widget.nomProduit, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Quantité', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
                QuantityStepper(valeur: _quantite, onChanged: (v) => setState(() => _quantite = v)),
              ],
            ),
            const SizedBox(height: AppSizes.md),

            const Text('Précision (optionnel)', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary)),
            const SizedBox(height: AppSizes.sm),
            TextField(
              controller: _precisionController,
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'Ex : sans glaçage, à retirer le soir'),
            ),
            const SizedBox(height: AppSizes.md),

            Container(
              padding: const EdgeInsets.all(AppSizes.md),
              decoration: BoxDecoration(color: AppColors.mint50, borderRadius: BorderRadius.circular(AppSizes.radiusMd)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total estimé', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                  Text(
                    PriceFormatter.format(total),
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.primaryDark),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.lg),

            PrimaryButton(label: 'Envoyer sur WhatsApp', onPressed: _envoyer, afficherFleche: false),
          ],
        ),
      ),
    );
  }
}