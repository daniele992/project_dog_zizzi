import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Null = tutti, true = admin, false = non admin
final userAdminFilterProvider = StateProvider<bool?>((ref) => null);