import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

enum SingingCharacter { lafayette, jefferson }

class _SubscribePageState extends State<SubscribePage> {
  SingingCharacter? _character = SingingCharacter.lafayette;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        elevation: 1,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Your actions to combat climate change are making a meaningful difference",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30.sp,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: const BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "I want to offset...",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  OptionWidget(
                    character: _character,
                    rupees: "Rs 400/month",
                    text: "100% of my footprint",
                  ),
                  OptionWidget(
                    character: _character,
                    rupees: "Rs 500/month",
                    text: "120% of my footprint",
                  ),
                  OptionWidget(
                    character: _character,
                    rupees: "Rs 800/month",
                    text: "200% of my footprint",
                  ),
                  OptionWidget(
                    character: _character,
                    rupees: "",
                    text: "Custom",
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

class OptionWidget extends StatelessWidget {
  final String text;
  final String rupees;
  const OptionWidget({
    super.key,
    required SingingCharacter? character,
    required this.text,
    required this.rupees,
  }) : _character = character;

  final SingingCharacter? _character;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border(
          bottom: BorderSide(
            color: Colors.green,
          ),
          top: BorderSide(
            color: Colors.green,
          ),
          left: BorderSide(
            color: Colors.green,
          ),
          right: BorderSide(
            color: Colors.green,
          ),
        ),
      ),
      child: ListTile(
        onTap: () {},
        contentPadding: const EdgeInsets.all(8),
        tileColor: Colors.white,
        trailing: Text(rupees),
        title: Text(text),
        leading: Radio<SingingCharacter>(
          activeColor: Colors.green,
          toggleable: true,
          value: SingingCharacter.lafayette,
          groupValue: _character,
          onChanged: (SingingCharacter? value) {
            // setState(() {
            //   _character = value;
            // });
          },
        ),
      ),
    );
  }
}
