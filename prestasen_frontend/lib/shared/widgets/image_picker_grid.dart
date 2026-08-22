import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class ImagePickerGrid extends StatefulWidget {
  final List<String> imagesUrls;
  final ValueChanged<List<String>> onChanged;
  final Future<String> Function(XFile) onUpload;
  final int maxImages;

  const ImagePickerGrid({
    super.key,
    required this.imagesUrls,
    required this.onChanged,
    required this.onUpload,
    this.maxImages = 5,
  });

  @override
  State<ImagePickerGrid> createState() => _ImagePickerGridState();
}

class _ImagePickerGridState extends State<ImagePickerGrid> {
  bool _envoiEnCours = false;

  Future<void> _ajouterImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 82);
    if (image == null) return;

    setState(() => _envoiEnCours = true);
    try {
      final url = await widget.onUpload(image);
      widget.onChanged([...widget.imagesUrls, url]);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Échec de l\'envoi de l\'image')),
        );
      }
    } finally {
      if (mounted) setState(() => _envoiEnCours = false);
    }
  }

  void _supprimer(int index) {
    final copie = [...widget.imagesUrls]..removeAt(index);
    widget.onChanged(copie);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSizes.sm,
      runSpacing: AppSizes.sm,
      children: [
        for (int i = 0; i < widget.imagesUrls.length; i++) _vignette(i),
        if (widget.imagesUrls.length < widget.maxImages) _boutonAjouter(),
      ],
    );
  }

  Widget _vignette(int index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          child: CachedNetworkImage(
            imageUrl: widget.imagesUrls[index],
            width: 88,
            height: 88,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () => _supprimer(index),
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(color: Colors.black54, shape: BoxShape.circle),
              child: const Icon(LucideIcons.x, size: 14, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _boutonAjouter() {
    return GestureDetector(
      onTap: _envoiEnCours ? null : _ajouterImage,
      child: Container(
        width: 88,
        height: 88,
        decoration: BoxDecoration(
          color: AppColors.mint50,
          borderRadius: BorderRadius.circular(AppSizes.radiusMd),
          border: Border.all(color: AppColors.border, style: BorderStyle.solid),
        ),
        alignment: Alignment.center,
        child: _envoiEnCours
            ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
            : const Icon(LucideIcons.plus, color: AppColors.primary, size: 26),
      ),
    );
  }
}