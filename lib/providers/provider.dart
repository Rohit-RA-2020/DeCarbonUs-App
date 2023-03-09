import 'package:decarbonus/models/blogs_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoading = StateProvider((ref) => false);
final authRes = StateProvider((ref) => '');
final authToken = StateProvider((ref) => 0);
final responses = StateProvider<Map<String, int>>((ref) => {});
final footprintResultProvider =
    StateProvider<Map<String, dynamic>>((ref) => {});

final connectionProvider = StateProvider((ref) => true);
final statuscode = StateProvider((ref) => 0);

final subscriptionProvider = StateProvider((ref) => 0);

final blogsProvider = StateProvider<List<BlogsModel>>((ref) => []);
