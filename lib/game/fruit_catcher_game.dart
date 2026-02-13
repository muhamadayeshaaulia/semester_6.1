import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class FruitCatcherGame extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF87CEEB);
  final ValueNotifier<int> counter = ValueNotifier(0);
  @override
  Future<void> onLoad() async {
    await super.onLoad();
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
