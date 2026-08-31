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
            await AudioManager.playBlip();
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
      margin: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
      padding: const EdgeInsets.all(18.0),
      constraints: const BoxConstraints(minHeight: 140, maxHeight: 190),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF120909),
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: const Color(0xFFE53935), width: 4.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFE53935).withOpacity(0.2),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Text(
          _displayedText,
          style: const TextStyle(
            fontSize: 22.0,
            color: Colors.white,
            height: 1.35,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}