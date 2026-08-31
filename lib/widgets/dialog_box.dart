import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../audio_manager.dart'; // Importa el manager

class DialogBox extends StatefulWidget {
  final String text;
  const DialogBox({super.key, required this.text});

  @override
  State<DialogBox> createState() => DialogBoxState(); 
}

class DialogBoxState extends State<DialogBox> { 
  String _displayedText = "";
  Timer? _timer;
  int _currentIndex = 0;

  bool get isTyping => _timer?.isActive ?? false;

  void finishTyping() {
    _timer?.cancel();
    AudioManager.blipPlayer.stop(); // Usamos el global
    setState(() {
      _displayedText = widget.text;
      _currentIndex = widget.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _startTyping();
  }

  @override
  void didUpdateWidget(DialogBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _startTyping();
    }
  }

  void _startTyping() {
    _timer?.cancel();
    setState(() {
      _displayedText = "";
      _currentIndex = 0;
    });

    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) async {
      if (_currentIndex < widget.text.length) {
        final char = widget.text[_currentIndex];
        
        setState(() {
          _displayedText += char;
          _currentIndex++;
        });

        if (char != ' ' && char != '\n') {
          try {
            // Quitamos el stop() previo, solo disparamos play()
            AudioManager.blipPlayer.play(AssetSource('audio/voz_blip.wav')); 
          } catch (_) {
            // Try-catch evita que la animación de texto se congele si iOS rechaza un frame de audio
          }
        }
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    // NO hacemos dispose del reproductor aquí, porque ahora es global
    super.dispose();
  }

  // ... (El bloque build queda exactamente igual)
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      padding: const EdgeInsets.all(24.0),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white, width: 6.0),
      ),
      child: Text(
        _displayedText,
        style: const TextStyle(
          fontSize: 26.0,
          color: Colors.white,
          height: 1.3,
        ),
      ),
    );
  }
}