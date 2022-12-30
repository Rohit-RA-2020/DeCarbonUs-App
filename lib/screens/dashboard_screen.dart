import 'package:flutter/material.dart';

import 'components/image_container.dart';
import 'components/offset_button.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              ImageContainer(),
              OffSetButton(),
            ],
          ),
        ),
      ),
    );
  }
}