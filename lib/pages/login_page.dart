import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/user_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  final String title;

  const LoginPage(this.title, {Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Looks like you're not logged in. Let's change that."),
            ElevatedButton(
              onPressed: () {
                ref.read(userProvider.notifier).login(
                      "myEmail",
                      "myPassword",
                    );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
