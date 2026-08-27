class Scene {
  final String text;
  final String spritePath;
  final String? audioPath; 
  final String? coverPath; // <-- Nueva variable para la portada de la canción
  final bool stopMusic; 
  final int? autoAdvanceSeconds; 
  final bool isSkippable; 

  Scene({
    required this.text,
    required this.spritePath,
    this.audioPath,
    this.coverPath,
    this.stopMusic = false, 
    this.autoAdvanceSeconds,
    this.isSkippable = true,
  });
}