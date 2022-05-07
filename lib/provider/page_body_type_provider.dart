import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/page_body_type.dart';

final pageBodyTypeProvider =
    StateProvider<PageBodyType>((ref) => PageBodyType.home);
