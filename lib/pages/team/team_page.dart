import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  final String title;

  const TeamPage({Key? key, required this.title}) : super(key: key);

  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, child: const Text("Team"));
  }
}
