import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import '../fruit_catcher_game.dart';

class Basket extends PositionComponent
    with HasGameRef<FruitCatcherGame>, CollisionCallbacks, DragCallbacks {
  Basket() : super(size: Vector2(80, 60), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = Vector2(gameRef.size.x / 2, gameRef.size.y - 100);
    add(RectangleHitbox());
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    position.x += event.localDelta.x;
    double halfWidth = size.x / 2;
    position.x = position.x.clamp(halfWidth, gameRef.size.x - halfWidth);
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.x, size.y),
      const Radius.circular(10),
    );
    canvas.drawRRect(rect, paint);
    final handlePaint = Paint()
      ..color = Colors.brown[800]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final handlePath = Path()
      ..moveTo(10, 0)
      ..quadraticBezierTo(size.x / 2, -20, size.x - 10, 0);
    canvas.drawPath(handlePath, handlePaint);
  }
}
