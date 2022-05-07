import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/router_provider.dart';

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Comment out the implementation you're not using
    final router = ref.watch(routerProvider); // I like this one better
    // final router = ref.watch(router2Provider);
    // final router = ref.watch(router3Provider);

    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      title: 'flutter_riverpod + go_router Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
