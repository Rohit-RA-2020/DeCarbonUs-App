import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: const [
            Text('Blogs'),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Card(
                elevation: 0,
                child: ListTile(
                  title: Text('Blog Title'),
                  subtitle: Text('Blog Description'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
