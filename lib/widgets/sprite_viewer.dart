import 'package:flutter/material.dart';

class SpriteViewer extends StatelessWidget {
  final String imagePath;

  const SpriteViewer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Container(
      height: screenHeight < 700 ? 190 : 250,
      alignment: Alignment.center,
      child: Image.asset(
        imagePath,
        fit: BoxFit.contain,
        // CRÍTICO para Pixel Art: Evita que la imagen se vea borrosa al hacerle zoom
        filterQuality: FilterQuality.none, 
        errorBuilder: (context, error, stackTrace) {
          // Un cuadrito de error amigable por si olvidas poner la imagen en la carpeta assets
          return Container(
            width: 100,
            height: 100,
            color: Colors.grey[800],
            child: const Icon(Icons.person, color: Colors.white),
          );
        },
      ),
    );
  }
}