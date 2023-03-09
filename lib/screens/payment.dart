import 'package:decarbonus/constants/price_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/provider.dart';

class PaymentPage extends ConsumerStatefulWidget {
  const PaymentPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentPageState();
}

class _PaymentPageState extends ConsumerState<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    int index = ref.watch(subscriptionProvider);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70.sp,
          ),
          Text(
            "Summary",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.sp,
            ),
          ),
          SizedBox(
            height: 30.sp,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 45.sp, horizontal: 100.sp),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                ),
                top: BorderSide(
                  color: Colors.grey,
                ),
                left: BorderSide(
                  color: Colors.grey,
                ),
                right: BorderSide(
                  color: Colors.grey,
                ),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  "Annual offsets",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "2.99",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Tons CO2e",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding:
                    EdgeInsets.symmetric(horizontal: 18.sp, vertical: 30.sp),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                    top: BorderSide(
                      color: Colors.grey,
                    ),
                    left: BorderSide(
                      color: Colors.grey,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Footprint coverage",
                      style: TextStyle(
                        fontSize: 11.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      packages[index]['coverage'].toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10.sp,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                padding:
                    EdgeInsets.symmetric(horizontal: 18.sp, vertical: 30.sp),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                    ),
                    top: BorderSide(
                      color: Colors.grey,
                    ),
                    left: BorderSide(
                      color: Colors.grey,
                    ),
                    right: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Monthly Charge",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Rs. ${packages[index]['amt']}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.sp,
          ),
          Text(
            "Choose payment method:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            margin: EdgeInsets.all(22.sp),
            child: ListTile(
              onTap: () {},
              leading: Image.asset(
                'assets/images/google_logo.png',
                width: 30.w,
              ),
              contentPadding: const EdgeInsets.all(8),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text("Google Pay"),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.sp),
              ),
            ),
            margin: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 22.sp),
            child: ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.credit_card,
              ),
              contentPadding: const EdgeInsets.all(8),
              trailing: const Icon(Icons.arrow_forward),
              title: const Text("Credid/Debit Card"),
            ),
          ),
        ],
      ),
    );
  }
}
