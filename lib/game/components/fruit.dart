import 'dart:math';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import '../fruit_catcher_game.dart';
import 'basket.dart';

enum FruitType { apple, banana, orange, strawberry }

class Fruit extends PositionComponent
    with HasGameRef<FruitCatcherGame>, CollisionCallbacks {
  final FruitType type;
  final double fallSpeed = 200;
  final Random _random = Random();
  Fruit()
    : type = FruitType.values[Random().nextInt(FruitType.values.length)],
      super(size: Vector2.all(40));

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    anchor = Anchor.center;
    add(CircleHitbox());
    double screenWidth = gameRef.size.x;
    double randomX = _random.nextDouble() * (screenWidth - size.x);
    randomX += size.x / 2;
    position = Vector2(randomX, -50);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += fallSpeed * dt;
    if (position.y > gameRef.size.y + 50) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is Basket) {
      gameRef.incrementScore();
      removeFromParent();
    }
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..style = PaintingStyle.fill;
    switch (type) {
      case FruitType.apple:
        paint.color = Colors.red;
        break;
      case FruitType.banana:
        paint.color = Colors.yellow;
        break;
      case FruitType.orange:
        paint.color = Colors.orange;
        break;
      case FruitType.strawberry:
        paint.color = Colors.pink;
        break;
    }
    canvas.drawCircle(Offset(size.x / 2, size.y / 2), size.x / 2, paint);
    final shinePaint = Paint()
      ..color = Colors.white.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(
      Offset(size.x / 2 - 5, size.y / 2 - 5),
      size.x / 5,
      shinePaint,
    );
  }
}
