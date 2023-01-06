import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoading = StateProvider((ref) => false);

final authRes = StateProvider((ref) => '');
final authToken = StateProvider((ref) => 0);

final queIndex = StateProvider((ref) => 0.0);