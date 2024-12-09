// image_previews.dart

import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviews extends StatelessWidget {
  final List<String> imagePaths;
  final void Function(int) onDelete;

  const ImagePreviews(
    this.imagePaths, {
    super.key,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return imagePaths.isEmpty
        ? const SizedBox.shrink()
        : Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(
              imagePaths.length,
              (index) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(imagePaths[index] as File),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Positioned(
                      top: -8,
                      right: -8,
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                        onPressed: () => onDelete(index),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
  }
}
