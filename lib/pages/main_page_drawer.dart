import 'package:bball/common/page_body_type.dart';
import 'package:bball/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/page_body_type_provider.dart';

class DrawPage extends ConsumerWidget {
  const DrawPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('我的档案'),
          ),
          ListTile(
            title: const Text('我的首页'),
            onTap: () {
              // Update the state of the app
              ref
                  .read(pageBodyTypeProvider.state)
                  .update((state) => PageBodyType.home);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('我的球队'),
            onTap: () {
              // Update the state of the app
              ref
                  .read(pageBodyTypeProvider.state)
                  .update((state) => PageBodyType.team);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('我的比赛'),
            onTap: () {
              // Update the state of the app
              ref
                  .read(pageBodyTypeProvider.state)
                  .update((state) => PageBodyType.game);
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('退出'),
            onTap: () {
              // Update the state of the app
              ref.read(userProvider.notifier).logout();
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
