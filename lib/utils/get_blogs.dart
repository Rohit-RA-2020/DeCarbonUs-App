import 'dart:convert';
import 'package:decarbonus/models/blogs_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider.dart';

void getBlogs(WidgetRef ref, BuildContext context) async {
  var dio = Dio();
  try {
    await dio
        .get('https://api-account-345807.el.r.appspot.com/blogs')
        .then((value) {
      if (value.statusCode == 200) {
        final welcome = blogsModelFromJson(jsonEncode(value.data));
        ref.read(blogsProvider.notifier).state = welcome;
      }
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Cannot Load Blogs'),
    ));
  }
}
