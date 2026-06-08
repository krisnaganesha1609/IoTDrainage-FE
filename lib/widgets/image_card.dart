import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageCard extends StatelessWidget {
  final String? imageUrl;
  final String? timestamp;
  final VoidCallback? onTap;

  const ImageCard({super.key, this.imageUrl, this.timestamp, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),
          Positioned(
            top: 12,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                timestamp ?? '',
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Colors.white60,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.asset("assets/images/symbol_expand.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage() {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Container(color: Colors.grey.shade300);
    }
    return Image.network(
      imageUrl!,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return Container(color: Colors.grey.shade300);
      },
      errorBuilder: (context, error, stackTrace) => Container(color: Colors.grey.shade400),
    );
  }
}
