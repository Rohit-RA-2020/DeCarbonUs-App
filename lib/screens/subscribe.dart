import 'package:decarbonus/screens/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

var options = [
  OffSetOptions.n100,
  OffSetOptions.n120,
  OffSetOptions.n200,
  OffSetOptions.custom,
];

enum OffSetOptions { n100, n120, n200, custom }

class _SubscribePageState extends State<SubscribePage> {
  OffSetOptions _option = OffSetOptions.n100;

  int _selectedIndex = 0;

  var packages = [
    {
      "title": "100% of my footprint",
      "price": "Rs 400/month",
    },
    {
      "title": "120% of my footprint",
      "price": "Rs 500/month",
    },
    {
      "title": "200% of my footprint",
      "price": "Rs 800/month",
    },
    {
      "title": "Custom",
      "price": "",
    }
  ];

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
              height: MediaQuery.of(context).size.height * 0.5.sp,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.all(
                  Radius.circular(25.sp),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "I want to offset...",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50.sp),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (contex, index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(18.sp),
                        ),
                        border: _selectedIndex == index
                            ? const Border(
                                bottom: BorderSide(
                                  width: 3,
                                  color: Colors.green,
                                ),
                                top: BorderSide(
                                  width: 3,
                                  color: Colors.green,
                                ),
                                left: BorderSide(
                                  width: 3,
                                  color: Colors.green,
                                ),
                                right: BorderSide(
                                  width: 3,
                                  color: Colors.green,
                                ),
                              )
                            : null,
                      ),
                      child: ListTile(
                        onTap: () {},
                        contentPadding: const EdgeInsets.all(8),
                        trailing: Text(packages[index]["price"]!),
                        title: Text(packages[index]["title"]!),
                        leading: Radio<OffSetOptions>(
                          activeColor: Colors.green,
                          value: options[index],
                          groupValue: _option,
                          onChanged: (OffSetOptions? value) {
                            setState(() {
                              _selectedIndex = index;
                              _option = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 70.sp),
              child: ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
                  );
                },
                child: const Text("Select"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
