import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoading = StateProvider((ref) => false);
final authRes = StateProvider((ref) => '');
final authToken = StateProvider((ref) => 0);
final responses = StateProvider<Map<String, int>>((ref) => {});
final footprintResultProvider =
    StateProvider<Map<String, dynamic>>((ref) => {});

final connectionProvider = StateProvider((ref) => true);