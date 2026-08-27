import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class DialogBox extends StatefulWidget {
  final String text;
  
  const DialogBox({super.key, required this.text});

  @override
  // NOTA: Le quitamos el guion bajo a DialogBoxState para hacerlo público
  State<DialogBox> createState() => DialogBoxState(); 
}

// NOTA: Aquí también quitamos el guion bajo
class DialogBoxState extends State<DialogBox> { 
  String _displayedText = "";
  Timer? _timer;
  int _currentIndex = 0;
  
  final AudioPlayer _blipPlayer = AudioPlayer();

  // Esta variable nos avisa si el texto aún se está animando
  bool get isTyping => _timer?.isActive ?? false;

  // Esta función fuerza a que el texto aparezca de golpe
  void finishTyping() {
    _timer?.cancel();
    _blipPlayer.stop(); // Detenemos el sonido de inmediato
    setState(() {
      _displayedText = widget.text;
      _currentIndex = widget.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    _blipPlayer.setVolume(0.7);
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
          await _blipPlayer.stop();
          await _blipPlayer.play(AssetSource('audio/voz_blip.wav')); 
        }
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _blipPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final horizontalMargin = (screenSize.width * 0.04).clamp(12.0, 16.0);
    final contentPadding = (screenSize.width * 0.045).clamp(14.0, 24.0);
    final dialogHeight = (screenSize.height * 0.21).clamp(132.0, 160.0);
    final textSize = (screenSize.width * 0.06).clamp(20.0, 26.0);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin, vertical: 16.0),
      padding: EdgeInsets.all(contentPadding),
      height: dialogHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF101014),
        border: Border.all(color: const Color(0xFFE63946), width: 4.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Text(
        _displayedText,
        style: TextStyle(
          fontSize: textSize,
          color: Colors.white,
          height: 1.3,
        ),
      ),
    );
  }
}