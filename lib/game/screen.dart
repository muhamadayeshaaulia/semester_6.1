import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:semster_6_1/game/fruit_catcher_game.dart';
import 'package:semster_6_1/game/managers/audio_manager.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late FruitCatcherGame game;
  final ValueNotifier<int> counter = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    game = FruitCatcherGame();
    AudioManager().playBackgroundMusic();
  }

  @override
  void dispose() {
    AudioManager().stopBackgroundMusic();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GameWidget(game: game),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ValueListenableBuilder<int>(
                valueListenable: counter,
                builder: (context, value, child) {
                  return Text(
                    'Score: $value',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.music_note, color: Colors.blue),
                  onPressed: () {
                    AudioManager().toggleSfx();
                    if (AudioManager().isSfxEnabled) {
                      AudioManager().playSfx('sfx1.mp3');
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.volume_up, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
