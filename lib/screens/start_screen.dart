import 'package:flutter/material.dart';
import 'game_screen.dart';
import '../audio_manager.dart'; // Importa el manager

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () async {
          // Desbloqueamos los canales con el toque de la pantalla
          await AudioManager.unlockIOS();
          await Future.delayed(const Duration(milliseconds: 100));

          if (context.mounted) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const GameScreen()),
            );
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tu_portada.jpg', 
                height: 250,
                fit: BoxFit.contain,
                filterQuality: FilterQuality.none,
              ),
              const SizedBox(height: 50),
              const Text(
                "[ Toca la pantalla para empezar ]",
                style: TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}