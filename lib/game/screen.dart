import 'package:flutter/material.dart';

class GameSacreen extends StatelessWidget {
  const GameSacreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Game akan di tampilkan disini',
          style: TextStyle(fontSize: 24),
        ),
      ),
    ) ;
  }
}