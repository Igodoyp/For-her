import 'package:flutter_test/flutter_test.dart';
import 'package:anniversary_app/audio_manager.dart';

void main() {
  test('el sonido de voz usa un formato compatible con iOS', () {
    expect(AudioManager.blipAssetPath, 'audio/voz_blip.mp3');
    expect(AudioManager.blipAssetPath, isNot('audio/voz_blip.wav'));
  });
}
