import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'game_provider.dart';
import 'game_screen.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GameProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe Game',
      debugShowCheckedModeBanner: false,
      home: const GameScreen(title: 'Tic-Tac-Toe'),
    );
  }
}
