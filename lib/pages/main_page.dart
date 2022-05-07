import 'package:bball/common/page_body_type.dart';
import 'package:bball/pages/game/game_page.dart';
import 'package:bball/pages/home/home_page.dart';
import 'package:bball/pages/team/team_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/page_body_type_provider.dart';
import 'main_page_drawer.dart';

class MainPage extends ConsumerStatefulWidget {
  final String title;

  const MainPage(this.title, {Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  // final int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("demo")),
        body: bodyFunction(),
        drawer: const DrawPage(
          title: '',
        ));
  }

  Widget bodyFunction() {
    final type = ref.watch(pageBodyTypeProvider);
    switch (type) {
      case PageBodyType.game:
        return const GamePage(title: "hello game");
      case PageBodyType.team:
        return const TeamPage(title: "hello team");
      case PageBodyType.home:
        return const HomePage(title: "hello home");
    }
  }
}
