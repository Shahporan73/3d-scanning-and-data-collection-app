import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowFullScreenImageDialog extends StatelessWidget {
  final String? imageUrl;
  final File? imageFile;

  const ShowFullScreenImageDialog({
    super.key,
    this.imageUrl,
    this.imageFile,
  });

  @override
  Widget build(BuildContext context) {
    final isFile = imageFile != null;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      child: Stack(
        children: [
          Positioned.fill(
            child: InteractiveViewer(
              child: isFile
                  ? Image.file(
                imageFile!,
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
              )
                  : CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                fit: BoxFit.contain,
                width: double.infinity,
                height: double.infinity,
                placeholder: (_, __) => const Center(child: CircularProgressIndicator()),
                errorWidget: (_, __, ___) => const Center(child: Icon(Icons.broken_image)),
              ),
            ),
          ),
          Positioned(
            top: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                child: const Icon(Icons.close, color: Colors.white, size: 24),
                onTap: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
