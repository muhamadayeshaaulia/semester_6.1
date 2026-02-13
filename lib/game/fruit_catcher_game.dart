import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:semster_6_1/game/components/basket.dart';
import 'package:semster_6_1/game/components/fruit.dart';
import 'package:semster_6_1/game/managers/audio_manager.dart';

class FruitCatcherGame extends FlameGame with HasCollisionDetection {
  final ValueNotifier<int> scoreNotifier;

  FruitCatcherGame({required this.scoreNotifier});

  int score = 0;
  late Basket basket;
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    AudioManager().playBackgroundMusic();

    basket = Basket();
    add(basket);
    add(
      TimerComponent(
        period: 1.5,
        repeat: true,
        onTick: () {
          add(Fruit());
        },
      ),
    );
  }

  void incrementScore() {
    score++;
    scoreNotifier.value = score;

    AudioManager().playSfx('sfx1.mp3');
  }
}
