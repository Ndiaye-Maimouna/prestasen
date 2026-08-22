import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../core/constants/app_colors.dart';

class ImageGallery extends StatefulWidget {
  final List<String> images;
  final double height;

  const ImageGallery({super.key, required this.images, this.height = 280});

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  final _controller = PageController();
  int _pageActuelle = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.images.isEmpty) {
      return Container(
        height: widget.height,
        color: AppColors.mint50,
        alignment: Alignment.center,
        child: const Icon(LucideIcons.image, size: 42, color: AppColors.primaryLight),
      );
    }

    return SizedBox(
      height: widget.height,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: widget.images.length,
            onPageChanged: (index) => setState(() => _pageActuelle = index),
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: widget.images[index],
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder: (context, _) => Container(color: AppColors.mint50),
              errorWidget: (context, _, __) => Container(
                color: AppColors.mint50,
                child: const Icon(LucideIcons.imageOff, color: AppColors.primaryLight),
              ),
            ),
          ),
          if (widget.images.length > 1)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(widget.images.length, (index) {
                  final estActive = index == _pageActuelle;
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: estActive ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: estActive ? Colors.white : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }
}