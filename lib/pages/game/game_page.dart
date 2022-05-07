import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  final String title;

  const GamePage({Key? key, required this.title}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Text("Game"));
  }
}
