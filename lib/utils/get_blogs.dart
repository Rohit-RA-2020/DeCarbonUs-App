import 'package:decarbonus/models/blogs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../providers/provider.dart';

void getBlogs(WidgetRef ref, BuildContext context) async {
  var client = http.Client();
  try {
    await client
        .get(Uri.parse('https://api-account-345807.el.r.appspot.com/blogs'))
        .then((value) {
      if (value.statusCode == 200) {
        final welcome = blogsModelFromJson(value.body);
        ref.read(blogsProvider.notifier).state = welcome;
      }
    });
  } catch (feelings) {
    //print(feelings);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cannot Load Blogs'),
    ));
  }
}
