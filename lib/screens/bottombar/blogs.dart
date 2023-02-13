import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../providers/provider.dart';

class Blogs extends ConsumerWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blogs = ref.watch(blogsProvider);
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          itemCount: blogs.length,
          itemBuilder: (context, index) {
            return BlogPage(
              title: blogs[index].title,
              description: blogs[index].desc,
              image: blogs[index].image,
              author: blogs[index].author,
              link: blogs[index].link,
            );
          },
        ),
      ),
    );
  }
}

class BlogPage extends StatelessWidget {
  const BlogPage({
    required this.title,
    required this.description,
    required this.image,
    required this.author,
    required this.link,
    super.key,
  });

  final String title;
  final String description;
  final String image;
  final String author;
  final String link;

  void _launchUrl() {
    final uri = Uri.parse(link);

    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _launchUrl,
                      child: const Text("Read More"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
