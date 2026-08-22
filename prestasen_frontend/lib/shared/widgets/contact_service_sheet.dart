import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';
import '../../core/utils/whatsapp_helper.dart';
import 'primary_button.dart';

class ContactServiceSheet extends StatefulWidget {
  final String telephoneProfessionnel;
  final String nomProfessionnel;

  const ContactServiceSheet({
    super.key,
    required this.telephoneProfessionnel,
    required this.nomProfessionnel,
  });

  static Future<void> afficher(
      BuildContext context, {
        required String telephoneProfessionnel,
        required String nomProfessionnel,
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ContactServiceSheet(
        telephoneProfessionnel: telephoneProfessionnel,
        nomProfessionnel: nomProfessionnel,
      ),
    );
  }

  @override
  State<ContactServiceSheet> createState() => _ContactServiceSheetState();
}

class _ContactServiceSheetState extends State<ContactServiceSheet> {
  final _besoinController = TextEditingController();
  String _dateChoisie = 'Dès que possible';

  static const _optionsDate = ['Dès que possible', "Aujourd'hui", 'Demain', 'Cette semaine'];

  @override
  void dispose() {
    _besoinController.dispose();
    super.dispose();
  }

  Future<void> _envoyer() async {
    if (_besoinController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Décrivez brièvement votre besoin')),
      );
      return;
    }

    final succes = await WhatsAppHelper.contacterPourService(
      telephoneProfessionnel: widget.telephoneProfessionnel,
      nomProfessionnel: widget.nomProfessionnel,
      besoin: _besoinController.text.trim(),
      dateSouhaitee: _dateChoisie,
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
    return _SheetContainer(
      titre: 'Décrivez votre besoin',
      sousTitre: 'Le message sera envoyé sur WhatsApp à ${widget.nomProfessionnel}',
      enfant: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Votre besoin',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.sm),
          TextField(
            controller: _besoinController,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Ex : j\'ai une fuite d\'eau sous l\'évier de la cuisine',
            ),
          ),
          const SizedBox(height: AppSizes.md),
          const Text(
            'Date souhaitée',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.textSecondary),
          ),
          const SizedBox(height: AppSizes.sm),
          Wrap(
            spacing: AppSizes.sm,
            runSpacing: AppSizes.sm,
            children: _optionsDate.map((option) {
              final estSelectionne = _dateChoisie == option;
              return GestureDetector(
                onTap: () => setState(() => _dateChoisie = option),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 160),
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.md, vertical: 9),
                  decoration: BoxDecoration(
                    color: estSelectionne ? AppColors.primary : AppColors.mint50,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: estSelectionne ? Colors.white : AppColors.primaryDark,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: AppSizes.lg),
          PrimaryButton(label: 'Envoyer sur WhatsApp', onPressed: _envoyer, afficherFleche: false),
        ],
      ),
    );
  }
}

class _SheetContainer extends StatelessWidget {
  final String titre;
  final String sousTitre;
  final Widget enfant;

  const _SheetContainer({required this.titre, required this.sousTitre, required this.enfant});

  @override
  Widget build(BuildContext context) {
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
                  child: const Icon(LucideIcons.messageCircle, size: 19, color: AppColors.primary),
                ),
                const SizedBox(width: AppSizes.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(titre, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.textPrimary)),
                      Text(sousTitre, style: const TextStyle(fontSize: 12, color: AppColors.textSecondary)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.lg),
            enfant,
          ],
        ),
      ),
    );
  }
}