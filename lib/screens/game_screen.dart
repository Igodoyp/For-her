import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import '../models/scene_model.dart';
import '../widgets/dialog_box.dart';
import '../widgets/sprite_viewer.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _currentIndex = 0;
  final AudioPlayer _musicPlayer = AudioPlayer();
  final GlobalKey<DialogBoxState> _dialogKey = GlobalKey<DialogBoxState>();
  Timer? _autoAdvanceTimer;

  // Esta variable recordará la portada activa mientras suena la música
  String? _currentCoverPath;

  static const String _spriteFeliz = 'assets/images/sprite_feliz.jpeg';
  static const String _spriteEnamorado = 'assets/images/sprite_enamorado.jpeg';
  static const String _spriteShy = 'assets/images/sprite_shy.jpeg';
  static const String _spriteNeutro = 'assets/images/sprite_neutro.jpeg';
  static const String _spriteCantando = 'assets/images/sprite_cantando.jpeg';

  late final List<Scene> _scenes = [

    
    Scene(
      text: "Holaaaaaaaaaaaaaaaaa! :3",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "Hoy cumplimos ocho meses siendo novios.\nYIPEEEEEEEEEEEE! :3",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "Muchas gracias por todo este tiempo,\nes como un sueño para mí.",
      spritePath: _spriteEnamorado,
    ),
    Scene(
      text: "Debo confesarte algo...",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "Estuve escuchando tus playlists de Spotify sin decirte!",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "Pero no lo hice porque este obsesionado contigo o algo así. . . . . . . . . . . . . . . . . .",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "bueno, no fue SOLO por eso ok?",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "Asi que reuni algunas canciones que tú conocías",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "y algunas que yo conocía,\npara cantarte hoy día!",
      spritePath: _spriteFeliz,
    ),

    // visita

    Scene(
      text: "Empecemos por algunas en español",
      spritePath: _spriteCantando,
      audioPath: 'audio/visita.mp3',
      coverPath: 'assets/images/daltonico.jpg',
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "La semana me parte en dos\nDe viernes a domingoooooooooooo",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Tu visita me repara cuando nos conecta entonces vivooooooooooooo",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "Quiero que te vengas a vivir, todos los días conmigoooooooooooooo",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Quiero que te vengas a vivir, todos los días conmigoooooooooooooooooo...",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 8,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    
    
    
    // cobarde
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/cobarde.mp3',
      coverPath: 'assets/images/daltonico.jpg',
      autoAdvanceSeconds: 2,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia del asfalto donde dan paso tus pies",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia del destino a donde ves",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia de la ropa que le da abrigo a tu piel",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia del clima que te ampara y te es cruel",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia de la gente que te puede mirar",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Y de los que te pueden escuchar",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia si compartes tus momentos",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Envidia de esos cuerpos que inhalan desaliento",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Que tú exhalas y al toparte no admiran\nLa más grande maravillaaaa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 10,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

  

    // tan tuya
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/tan_tuya.mp3',
      coverPath: 'assets/images/tan_tuya.jpg',
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Y aunque esteeeeeeeeeeeemos tan enamorados",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Un tanto conectados, un poco encandilados",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Soy tan tuuuuuuuuuuuyo\nComo mííííííííío",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Eres tan míííííííííííía\nComo tuuuuuuuuuuuuuuuyaaaaa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 12,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

    

    // freebola
    Scene(
      text: "Esta me recuerda a cuando tocabamos juntos!",
      spritePath: _spriteFeliz,
      audioPath: 'audio/freebola.mp3',
      coverPath: 'assets/images/freebola.jpg',
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Jamás me hubiera imaginado que terminaríamos siendo pareja...",
      spritePath: _spriteShy,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Es el mejor plot twist que he tenido en la vida!!",
      spritePath: _spriteEnamorado,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Miiiiiiiireeeeeeeeeen\nMírenla bieeeeeeeeeeeeeeen",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Ella es tan liiiiiiiiiindaaaaaaa\nElla es tan freeeeeeeeeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Taaaaan freeeeeeeeeeeeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

    // ay ay ay
    Scene(
      text: "Y ahora...",
      spritePath: _spriteNeutro,
    ),
    Scene(
      text: "Una canción que expone algunos de mis sentimientos más profundos...",
      spritePath: _spriteNeutro,
    ),
    Scene(
      text: "Espero que te guste :3",
      spritePath: _spriteFeliz,
      audioPath: 'audio/ay_ay_ay.mp3',
      coverPath: 'assets/images/ay_ay_ay.png',
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: ". . . . . . . . . . . . . . . . . . . . . . . . . . ",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Oop!",
      spritePath: _spriteShy,
      stopMusic: true,
    ),
    Scene(
      text: "Esa no era -_-'",
      spritePath: _spriteShy,
    ),
    

    

    // un amor violento
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/un_amor_violento.mp3',
      coverPath: 'assets/images/los_tres.jpg',
      autoAdvanceSeconds: 14,
      isSkippable: false,
    ),
    Scene(
      text: "Cuando por primeeeeeeeeeeera vez te viiiiiiiiiiii",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "Supe que el cielo era para tiiiiiii",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Y para míííí\nY para ti y para míííííí",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 8,
      isSkippable: false,
    ),
    Scene(
      text: "Nunca máaaaaaas podré dormiiiiiiir",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Nunca mááááás podré soñaaaaaar",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "Con nadie queee\nNo seeeeeeas túúúú",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 9,
      isSkippable: false,
    ),
    Scene(
      text: "Gastarééééé todaaaaaaa mi vidaaaaa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "En compraaaaar laaa tuyaaa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Gastarééééé todaaaaaa mi vidaaaaa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Y máááááááááás",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 12,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    


    Scene(
      text: "Ahora algunas en inglés...",
      spritePath: _spriteFeliz,
    ),

    

    // sanctuary
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/sanctuary.mp3',
      coverPath: 'assets/images/sanctuary.jpg',
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "If you've been waiting for fallin' in loveeeeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Babe, you don't have to wait on meeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "'Cause I've been aiming for heaven above",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "But an angel ain't what I need",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Not anyone, you're the one\nMore than fun, you're the sanctuaryyyyyyy",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 12,
      isSkippable: false,
    ),
    Scene(
      text: "'Cause what you want is what I want\nSincerity",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 13,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),
    

    // lovesong
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/lovesong.mp3',
      coverPath: 'assets/images/lovesong.jpg',
      autoAdvanceSeconds: 9,
      isSkippable: false,
    ),
    Scene(
      text: "Whenever I'm alone with you",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "You make me feel like I am home again",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "Whenever I'm alone with you",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "You make me feel like I am whole again",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 16,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

    // robot voices
    Scene(
      text: "Esta canción me hizo pensar en ti desde que salió.",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "Desde el primer momento me hiciste sentir seguro y calientito.",
      spritePath: _spriteEnamorado,
    ),
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/robot_voices.mp3',
      coverPath: 'assets/images/robot_voices.png',
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "I waaasn't loooookin' for love this year",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "But my rooooobot toooold me that I shouldn't feeear",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "When I meeeet you, I fooound you safe and warm",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Then the robot voices would reassure meeeeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 12,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

    // helpless
    Scene(
      text: "Estar enamorado tuyo me hace sentir completamente indefenso...",
      spritePath: _spriteEnamorado,
    ),
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/helpless.mp3',
      coverPath: 'assets/images/hamilton.jpg',
      autoAdvanceSeconds: 1,
      isSkippable: false,
    ),
    Scene(
      text: "I'm helpleeeeeess\nOoooh, look at those eyeeeees, ooooh",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "I'm helpleeeeeeess, I knowwwww\nDown for the count, and I'm drowning in 'em",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "I am so into youuuuuu\nI am so into youuuuu",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "I'm helpless\nI'm down for the count, and I'm drownin' in 'em",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 8,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    // i was made for loving you
    Scene(
      text: "Amarte se siente muy natural...",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/i_was_made_for_lovin_you.mp3',
      coverPath: 'assets/images/i_was_made.jpg',
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "I was made for lovin' you, baby\nYou were made for lovin' me",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 7,
      isSkippable: false,
    ),
    Scene(
      text: "And I can't get enough of you, baby\nCan you get enough of me?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 11,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),

    

    // bobby sox
    Scene(
      text: "Bueno, esta es la última.",
      spritePath: _spriteNeutro,
    ),
    Scene(
      text: "Hoy no solo cumplimos ocho meses pololeando,",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "sino que también se cumple un año desde el concierto de green day...",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "Esta canción es muy especial.",
      spritePath: _spriteEnamorado,
    ),
    Scene(
      text: "Debo admitir que cuando tocaron esa canción,",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "mi corazón empezó a latir muy rápido,",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "y empecé a fantasear un poco con dedicartela algún día...",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "...",
      spritePath: _spriteCantando,
      audioPath: 'audio/bobby_sox.mp3',
      coverPath: 'assets/images/bobby_sox.jpg',
      autoAdvanceSeconds: 10,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my girlfriend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 3,
      isSkippable: false,
    ),
    Scene(
      text: "I'll take you to a movie that we've already seen",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Or sit at home and watch reruuuuuuuns",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "There's no other place I wanna beeeee",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "UuuuUuuuUUUuuhhh",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "c:",
      spritePath: _spriteFeliz,
      autoAdvanceSeconds: 6,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my giiiiirlfrieeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my giiiirlfrieeeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my boyfriend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "We'll walk the cemetery and I'll kiss you again",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "And make our dead friends blush, oh-whoa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "We'll be getting married right there on the scene",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my best friend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "You can drive me crazy all over again",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "And I'll bore you to death, oh-whoa",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Doesn't matter when we are in love",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),

    Scene(
      text: "Do you wanna be my boyyyfrieeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my boyyyfrieeeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my boyyyfrieeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 4,
      isSkippable: false,
    ),
    Scene(
      text: "Do you wanna be my boyyyfrieeeend?",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 5,
      isSkippable: false,
    ),

    Scene(
      text: "You're not just any type of giiirl, yeeeeeeah",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 9,
      isSkippable: false,
    ),
    Scene(
      text: "My one true love, and you're my woooorld, yeeeeah",
      spritePath: _spriteCantando,
      autoAdvanceSeconds: 23,
      isSkippable: false,
    ),
    Scene(
      text: "",
      spritePath: _spriteNeutro,
      autoAdvanceSeconds: 0,
      isSkippable: false,
      stopMusic: true,
    ),



    //final

    Scene(
      text: "Okei eso fue todo",
      spritePath: _spriteFeliz,
    ),
    Scene(
      text: "Muchas gracias por todo, haces mi vida mucho mas bonita con solo existir y ser tú misma :3",
      spritePath: _spriteShy,
    ),
    Scene(
      text: "Te amo!!!",
      spritePath: _spriteEnamorado,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _musicPlayer.setVolume(0.05); 
    _setupScene(); 
  }

  void _handleTap() {
    final currentScene = _scenes[_currentIndex];
    
    if (!currentScene.isSkippable) return; 

    final dialogState = _dialogKey.currentState;
    if (dialogState != null && dialogState.isTyping) {
      dialogState.finishTyping();
    } else {
      _nextScene();
    }
  }

  void _nextScene() {
    if (_currentIndex < _scenes.length - 1) {
      setState(() {
        _currentIndex++;
      });
      _setupScene(); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Te amo ❤️")),
      );
    }
  }

  void _setupScene() async {
    final scene = _scenes[_currentIndex];
    
    if (scene.stopMusic) {
      await _musicPlayer.stop();
      // Si se detiene la música, escondemos la portada
      setState(() {
        _currentCoverPath = null;
      });
    }
    
    if (scene.audioPath != null) {
      try {
        await _musicPlayer.stop(); 
        await _musicPlayer.play(AssetSource(scene.audioPath!));
        
        // Si la escena tiene una portada, la guardamos en el estado
        if (scene.coverPath != null) {
          setState(() {
            _currentCoverPath = scene.coverPath;
          });
        }
      } catch (error) {
        debugPrint('No se pudo reproducir ${scene.audioPath}: $error');
      }
    }

    _autoAdvanceTimer?.cancel(); 
    
    if (scene.autoAdvanceSeconds != null) {
      _autoAdvanceTimer = Timer(Duration(seconds: scene.autoAdvanceSeconds!), () {
        _nextScene();
      });
    }
  }

  void _stopMusic() async {
    await _musicPlayer.stop();
    setState(() {
      _currentCoverPath = null; // Botón manual también esconde la portada
    });
  }

  @override
  void dispose() {
    _autoAdvanceTimer?.cancel(); 
    _musicPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentScene = _scenes[_currentIndex];
    final screenSize = MediaQuery.sizeOf(context);
    final coverSize = (screenSize.width * 0.38).clamp(112.0, 200.0).toDouble();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onTap: _handleTap,
              behavior: HitTestBehavior.opaque, 
              child: Column(
                children: [
                  const Spacer(flex: 2), 
                  SpriteViewer(imagePath: currentScene.spritePath),
                  const Spacer(flex: 1), 
                  DialogBox(
                    key: _dialogKey, 
                    text: currentScene.text
                  ),
                  const SizedBox(height: 20), 
                ],
              ),
            ),
            
            // Renderizamos la portada en la esquina superior izquierda si existe
            if (_currentCoverPath != null)
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  width: coverSize,
                  height: coverSize,
                  decoration: BoxDecoration(
                    color: const Color(0xFF111111),
                    border: Border.all(color: Colors.white, width: 3.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 8,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    _currentCoverPath!,
                    fit: BoxFit.contain,
                    filterQuality: FilterQuality.none, // Mantiene todo nítido
                  ),
                ),
              ),

            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: _stopMusic,
                tooltip: 'Silenciar canción',
                icon: const Icon(Icons.volume_off_rounded),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black87,
                  side: const BorderSide(color: Colors.white, width: 1.5),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


