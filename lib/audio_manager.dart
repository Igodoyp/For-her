import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static const String blipAssetPath = 'audio/voz_blip.mp3';

  // Al ser estáticos, son los MISMOS reproductores en toda la app
  static final AudioPlayer musicPlayer = AudioPlayer();
  static final AudioPlayer blipPlayer = AudioPlayer();

  static Future<void> playBlip() async {
    try {
      await blipPlayer.play(AssetSource(blipAssetPath));
    } catch (_) {
      // Safari/Chrome en iOS no siempre aceptan WAV cortos; el asset compatible
      // se maneja por la ruta centralizada arriba.
    }
  }

  // Esta función engaña a iOS para desbloquear los canales de audio
  static Future<void> unlockIOS() async {
    // 1. Mutear
    await musicPlayer.setVolume(0.0);
    await blipPlayer.setVolume(0.0);

    // 2. Reproducir algo corto obligatoriamente con un formato compatible
    try {
      await blipPlayer.play(AssetSource(blipAssetPath));
      await blipPlayer.stop();
    } catch (_) {
      // iOS puede bloquear audio hasta que hay interacción del usuario.
    }

    // 3. Restaurar volúmenes base
    await musicPlayer.setVolume(0.2);
    await blipPlayer.setVolume(0.4);
  }
}