import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_model.dart';
import '../view_models/user_view_model.dart';

final userProvider = StateNotifierProvider<UserState, User?>((ref) {
  return UserState();
});
