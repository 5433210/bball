import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';

class UserState extends StateNotifier<User?> {
  UserState() : super(null);

  Future<void> login(String email, String password) async {
    // This mocks some sort of request / response
    state = const User(
      name: "My Name",
      email: "My Email",
    );
  }

  Future<void> logout() async {
    // In this example user==null iff we're logged out
    state = null; // No request is mocked here but I guess we could
  }
}
