import 'package:flutter/material.dart';
import 'game_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final promptSize = (screenWidth * 0.06).clamp(18.0, 28.0);

    return Scaffold(
      body: GestureDetector(
        // Mantiene la funcionalidad de tocar en cualquier lado para empezar
        onTap: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const GameScreen()),
          );
        },
        behavior: HitTestBehavior.opaque,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/tu_portada.jpg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
              filterQuality: FilterQuality.none,
            ),
            SafeArea(
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      color: Colors.black87,
                      child: Text(
                      "[ Toca la pantalla para empezar ]",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: promptSize,
                        color: Colors.white,
                        height: 1.1,
                      ),
                    ),
                  ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}