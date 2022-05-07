import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../pages/login_page.dart';
import '../pages/main_page.dart';
import 'user_provider.dart';

// Another possible approach.
// In here, we want to exploit GoRouter's `RefreshStream`, as it is made exactly
// for this purpose.
// In the end, a GoRouterRefreshStream is just a ChangeNotifier with a stream
// that calls `notifyListeners()` whenever the state changes.
// This implementation saves us a few lines of code (i.e. the implementation of
// a Change Notifier), but it's slightly harder to manage different providers
// states and / or customize the `listen` behavior.
final routerProvider = Provider<GoRouter>((ref) {
  final listenable = GoRouterRefreshStream(
    ref.watch(userProvider.notifier).stream,
  );

  ref.onDispose(() {
    listenable.dispose();
  });

  return GoRouter(
    debugLogDiagnostics: true,
    redirect: (state) {
      // We want to READ the state, here.
      // GoRouter is already aware of state changes through `refreshListenable`
      // We don't want to trigger a rebuild of this provider.
      final user = ref.read(userProvider);

      // From here we can use the state and implement our custom logic
      final areWeLoggingIn = state.location == '/login';

      if (user == null) {
        // We're not logged in
        // So, IF we aren't in the login page, go there.
        return areWeLoggingIn ? null : '/login';
      }
      // We're logged in

      // At this point, IF we're in the login page, go to the home page
      if (areWeLoggingIn) return '/';

      // There's no need for a redirect at this point.
      return null;
    },
    // This is crucial to make the router work with Riverpod.
    refreshListenable: listenable,
    routes: [
      GoRoute(
        name: "main",
        path: '/',
        builder: (context, _) => const MainPage(""),
      ),
      GoRoute(
        name: "login",
        path: '/login',
        builder: (context, _) => const LoginPage(""),
      ),
    ],
  );
});
