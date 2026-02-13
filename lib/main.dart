import 'package:flutter/material.dart';
import 'package:semster_6_1/game/managers/audio_manager.dart';
import 'package:semster_6_1/game/screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AudioManager().initialize();
  AudioManager().playBackgroundMusic();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fruit catcher game',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const GameScreen(),
    );
  }
}
