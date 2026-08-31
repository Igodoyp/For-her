import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  // Al ser estáticos, son los MISMOS reproductores en toda la app
  static final AudioPlayer musicPlayer = AudioPlayer();
  static final AudioPlayer blipPlayer = AudioPlayer();

  // Esta función engaña a iOS para desbloquear los canales de audio
  static Future<void> unlockIOS() async {
    // 1. Mutear
    await musicPlayer.setVolume(0.0);
    await blipPlayer.setVolume(0.0);

    // 2. Reproducir algo corto obligatoriamente
    await musicPlayer.play(AssetSource('audio/voz_blip.wav'));
    await blipPlayer.play(AssetSource('audio/voz_blip.wav'));

    // 3. Detener y dejar listos los reproductores
    await musicPlayer.stop();
    await blipPlayer.stop();
    
    // 4. Restaurar volúmenes base
    await musicPlayer.setVolume(0.2);
    await blipPlayer.setVolume(0.4);
  }
}